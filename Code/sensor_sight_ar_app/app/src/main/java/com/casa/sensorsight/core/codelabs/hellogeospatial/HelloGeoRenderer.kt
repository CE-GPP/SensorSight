/*
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.casa.sensorsight.core.codelabs.hellogeospatial

import android.opengl.Matrix
import android.util.Log
import android.widget.Toast
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner
import com.casa.sensorsight.core.examples.java.common.helpers.DisplayRotationHelper
import com.casa.sensorsight.core.examples.java.common.helpers.TrackingStateHelper
import com.casa.sensorsight.core.examples.java.common.samplerender.*
import com.casa.sensorsight.core.examples.java.common.samplerender.arcore.BackgroundRenderer
import com.google.android.gms.maps.model.LatLng
import com.google.ar.core.Anchor
import com.google.ar.core.TrackingState
import com.google.ar.core.exceptions.CameraNotAvailableException
import com.google.ar.sceneform.AnchorNode
import com.google.ar.sceneform.Node
import com.google.ar.sceneform.math.Vector3
import com.google.ar.sceneform.rendering.*
import com.google.ar.sceneform.rendering.Texture
import java.io.IOException
import java.util.concurrent.ExecutionException


class HelloGeoRenderer(val activity: HelloGeoActivity) :
  SampleRender.Renderer, DefaultLifecycleObserver {
  //<editor-fold desc="ARCore initialization" defaultstate="collapsed">
  companion object {
    val TAG = "HelloGeoRenderer"

    private val Z_NEAR = 0.1f
    private val Z_FAR = 1000f
  }

  lateinit var backgroundRenderer: BackgroundRenderer
  lateinit var virtualSceneFramebuffer: Framebuffer
  var hasSetTextureNames = false

  // Virtual object (ARCore pawn)
  lateinit var virtualObjectMesh: Mesh
  lateinit var virtualObjectShader: Shader
  lateinit var virtualObjectTexture: com.casa.sensorsight.core.examples.java.common.samplerender.Texture

  // Temporary matrix allocated here to reduce number of allocations for each frame.
  val modelMatrix = FloatArray(16)
  val viewMatrix = FloatArray(16)
  val projectionMatrix = FloatArray(16)
  val modelViewMatrix = FloatArray(16) // view x model

  val modelViewProjectionMatrix = FloatArray(16) // projection x view x model

  val session
    get() = activity.arCoreSessionHelper.session

  val displayRotationHelper = DisplayRotationHelper(activity)
  val trackingStateHelper = TrackingStateHelper(activity)

  override fun onResume(owner: LifecycleOwner) {
    displayRotationHelper.onResume()
    hasSetTextureNames = false
  }

  override fun onPause(owner: LifecycleOwner) {
    displayRotationHelper.onPause()
  }

  override fun onSurfaceCreated(render: SampleRender) {
    // Prepare the rendering objects.
    // This involves reading shaders and 3D model files, so may throw an IOException.
    try {
      backgroundRenderer = BackgroundRenderer(render)
      virtualSceneFramebuffer = Framebuffer(render, /*width=*/ 1, /*height=*/ 1)

      // Virtual object to render (Geospatial Marker)
      virtualObjectTexture =
        com.casa.sensorsight.core.examples.java.common.samplerender.Texture.createFromAsset(
          render,
          "models/spatial_marker_baked.png",
          com.casa.sensorsight.core.examples.java.common.samplerender.Texture.WrapMode.CLAMP_TO_EDGE,
          com.casa.sensorsight.core.examples.java.common.samplerender.Texture.ColorFormat.SRGB
        )

      virtualObjectMesh = Mesh.createFromAsset(render, "models/geospatial_marker.obj");
      virtualObjectShader =
        Shader.createFromAssets(
          render,
          "shaders/ar_unlit_object.vert",
          "shaders/ar_unlit_object.frag",
          /*defines=*/ null)
          .setTexture("u_Texture", virtualObjectTexture)

      backgroundRenderer.setUseDepthVisualization(render, false)
      backgroundRenderer.setUseOcclusion(render, false)
    } catch (e: IOException) {
      Log.e(TAG, "Failed to read a required asset file", e)
      showError("Failed to read a required asset file: $e")
    }
  }

  override fun onSurfaceChanged(render: SampleRender, width: Int, height: Int) {
    displayRotationHelper.onSurfaceChanged(width, height)
    virtualSceneFramebuffer.resize(width, height)
  }
  //</editor-fold>

  override fun onDrawFrame(render: SampleRender) {
    val session = session ?: return

    //<editor-fold desc="ARCore frame boilerplate" defaultstate="collapsed">
    // Texture names should only be set once on a GL thread unless they change. This is done during
    // onDrawFrame rather than onSurfaceCreated since the session is not guaranteed to have been
    // initialized during the execution of onSurfaceCreated.
    if (!hasSetTextureNames) {
      session.setCameraTextureNames(intArrayOf(backgroundRenderer.cameraColorTexture.textureId))
      hasSetTextureNames = true
    }

    // -- Update per-frame state

    // Notify ARCore session that the view size changed so that the perspective matrix and
    // the video background can be properly adjusted.
    displayRotationHelper.updateSessionIfNeeded(session)

    // Obtain the current frame from ARSession. When the configuration is set to
    // UpdateMode.BLOCKING (it is by default), this will throttle the rendering to the
    // camera framerate.
    val frame =
      try {
        session.update()
      } catch (e: CameraNotAvailableException) {
        Log.e(TAG, "Camera not available during onDrawFrame", e)
        showError("Camera not available. Try restarting the app.")
        return
      }

    val camera = frame.camera

    // BackgroundRenderer.updateDisplayGeometry must be called every frame to update the coordinates
    // used to draw the background camera image.
    backgroundRenderer.updateDisplayGeometry(frame)

    // Keep the screen unlocked while tracking, but allow it to lock when tracking stops.
    trackingStateHelper.updateKeepScreenOnFlag(camera.trackingState)

    // -- Draw background
    if (frame.timestamp != 0L) {
      // Suppress rendering if the camera did not produce the first frame yet. This is to avoid
      // drawing possible leftover data from previous sessions if the texture is reused.
      backgroundRenderer.drawBackground(render)
    }

    // If not tracking, don't draw 3D objects.
    if (camera.trackingState == TrackingState.PAUSED) {
      return
    }

    // Get projection matrix.
    camera.getProjectionMatrix(projectionMatrix, 0, Z_NEAR, Z_FAR)

    // Get camera matrix and draw.
    camera.getViewMatrix(viewMatrix, 0)

    render.clear(virtualSceneFramebuffer, 0f, 0f, 0f, 0f)
    //</editor-fold>

    val earth = session.earth
    if (earth?.trackingState == TrackingState.TRACKING) {
      val cameraGeospatialPose = earth.cameraGeospatialPose
      activity.view.mapView?.updateMapPosition(
        latitude = cameraGeospatialPose.latitude,
        longitude = cameraGeospatialPose.longitude,
        heading = cameraGeospatialPose.heading
      )
      activity.view.updateStatusText(earth, cameraGeospatialPose)
    }

    // Draw the placed anchor, if it exists.
    earthAnchor?.let {
      render.renderCompassAtAnchor(it)
    }

    // Compose the virtual scene with the background.
    backgroundRenderer.drawVirtualScene(render, virtualSceneFramebuffer, Z_NEAR, Z_FAR)
  }

  var earthAnchor: Anchor? = null

  fun onMapClick(latLng: LatLng, manualAltitude: Double?, isClickedFromMap: Boolean) {
    activity.cameralatLng = latLng

    val anchorsList = ArrayList<AnchorNode>()

    val earth = session?.earth ?: return
    if (earth.trackingState != TrackingState.TRACKING) {
      return
    }
    earthAnchor?.detach()


    // Place the earth anchor at the same altitude as that of the camera to make it easier to view.
    val cameraGeospatialPose = earth.cameraGeospatialPose
    val altitude = cameraGeospatialPose.altitude - 1
    if(isClickedFromMap)
      activity.manualAltitude = altitude
    // The rotation quaternion of the anchor in EUS coordinates.
    val qx = 0f
    val qy = 0f
    val qz = 0f
    val qw = 1f

    val anchor1 = earth.createAnchor(latLng.latitude-0.0005, latLng.longitude-0.0005, 58.0, qx, qy, qz, qw)
    val anchor2 = earth.createAnchor(latLng.latitude+0.0005, latLng.longitude-0.0005, 58.0, qx, qy, qz, qw)
    val anchor3 = earth.createAnchor(latLng.latitude-0.0005, latLng.longitude+0.0005, 58.0, qx, qy, qz, qw)
    anchorsList.add(AnchorNode(anchor1))
    anchorsList.add(AnchorNode(anchor2))
    anchorsList.add(AnchorNode(anchor3))

    if (anchorsList.size == 3) {
      val sampler: Texture.Sampler = Texture.Sampler.builder()
        .setMinFilter(Texture.Sampler.MinFilter.LINEAR_MIPMAP_LINEAR)
        .setMagFilter(Texture.Sampler.MagFilter.LINEAR)
        .setWrapModeR(Texture.Sampler.WrapMode.REPEAT)
        .setWrapModeS(Texture.Sampler.WrapMode.REPEAT)
        .setWrapModeT(Texture.Sampler.WrapMode.REPEAT)
        .build()
      Texture.builder()
        .setSource { activity.assets.open("alexa.png") }
        .setSampler(sampler)
        .build()
        .thenAccept { texture ->
          MaterialFactory.makeOpaqueWithTexture(activity, texture)
            .thenAccept { material: Material? ->
              val node = Node()
              //val triangle = makeTriangleWithAnchors(anchorsList, material!!)
              //node.setParent(activity.getArSceneView().getScene())
              //node.setRenderable(triangle)
            }
        }
    }

    if(manualAltitude!= null){
      earthAnchor = earth.createAnchor(latLng.latitude, latLng.longitude, manualAltitude, qx, qy, qz, qw)
    } else {
      earthAnchor = earth.createAnchor(latLng.latitude, latLng.longitude, altitude, qx, qy, qz, qw)
    }
   // activity.runOnUiThread {
     // Toast.makeText(activity, "latitude: ${latLng.latitude} longitude:${latLng.longitude} altitude: {$altitude}", Toast.LENGTH_LONG).show()
    //}

    activity.view.mapView?.earthMarker?.apply {
      position = latLng
      isVisible = true
    }
  }

  private fun SampleRender.renderCompassAtAnchor(anchor: Anchor) {
    // Get the current pose of the Anchor in world space. The Anchor pose is updated
    // during calls to session.update() as ARCore refines its estimate of the world.
    anchor.pose.toMatrix(modelMatrix, 0)

    // Calculate model/view/projection matrices
    Matrix.multiplyMM(modelViewMatrix, 0, viewMatrix, 0, modelMatrix, 0)
    Matrix.multiplyMM(modelViewProjectionMatrix, 0, projectionMatrix, 0, modelViewMatrix, 0)

    // Update shader properties and draw
    virtualObjectShader.setMat4("u_ModelViewProjection", modelViewProjectionMatrix)
    draw(virtualObjectMesh, virtualObjectShader, virtualSceneFramebuffer)
  }

  private fun makeTriangleWithAnchors(anchorNodes: List<AnchorNode>, material: Material): ModelRenderable {
    check(anchorNodes.size == 3) { "Different count of anchorsList than 3" }

    val p0 = anchorNodes[0].worldPosition
    val p1 = anchorNodes[1].worldPosition
    val p2 = anchorNodes[2].worldPosition
    val up = Vector3.up()
    val uvTop = Vertex.UvCoordinate(0.5f, 1.0f)
    val uvBotLeft = Vertex.UvCoordinate(0.0f, 0.0f)
    val uvBotRight = Vertex.UvCoordinate(1.0f, 0.0f)
    val vertices = ArrayList(listOf(
      Vertex
        .builder()
        .setPosition(p0)
        .setNormal(up)
        .setUvCoordinate(uvTop)
        .build(),
      Vertex
        .builder()
        .setPosition(p1)
        .setNormal(up)
        .setUvCoordinate(uvBotRight)
        .build(),
      Vertex
        .builder()
        .setPosition(p2)
        .setNormal(up)
        .setUvCoordinate(uvBotLeft)
        .build()
    ))
    val triangleIndices = ArrayList<Int>(3)
    triangleIndices.add(0)
    triangleIndices.add(2)
    triangleIndices.add(1)
    triangleIndices.add(0)
    triangleIndices.add(1)
    triangleIndices.add(2)
    val submesh = RenderableDefinition.Submesh
      .builder()
      .setTriangleIndices(triangleIndices)
      .setMaterial(material)
      .build()

    val renderableDefinition = RenderableDefinition
      .builder()
      .setVertices(vertices)
      .setSubmeshes(listOf(submesh))
      .build()

    val future = ModelRenderable
      .builder()
      .setSource(renderableDefinition)
      .build()

    val result: ModelRenderable?
    result = try {
      future.get() as ModelRenderable
    } catch (e: InterruptedException) {
      throw AssertionError("Error creating renderable.", e)
    } catch (e: ExecutionException) {
      throw AssertionError("Error creating renderable.", e)
    }
    return result ?: throw AssertionError("Error creating renderable.")
  }

  private fun showError(errorMessage: String) =
    activity.view.snackbarHelper.showError(activity, errorMessage)
}
