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

import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.casa.sensorsight.core.codelabs.hellogeospatial.helpers.ARCoreSessionLifecycleHelper
import com.casa.sensorsight.core.codelabs.hellogeospatial.helpers.GeoPermissionsHelper
import com.casa.sensorsight.core.codelabs.hellogeospatial.helpers.HelloGeoView
import com.casa.sensorsight.core.examples.java.common.helpers.FullScreenHelper
import com.casa.sensorsight.core.examples.java.common.samplerender.SampleRender
import com.google.android.gms.maps.MapsInitializer
import com.google.android.gms.maps.model.LatLng
import com.google.ar.core.Config
import com.google.ar.core.Session
import com.google.ar.core.exceptions.*
import kotlin.properties.Delegates

class HelloGeoActivity : AppCompatActivity() {
  companion object {
    private const val TAG = "HelloGeoActivity"
  }

  lateinit var arCoreSessionHelper: ARCoreSessionLifecycleHelper
  lateinit var view: HelloGeoView
  lateinit var renderer: HelloGeoRenderer
  lateinit var cameralatLng: LatLng
  var manualAltitude by Delegates.notNull<Double>()



  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    //MapsInitializer.initialize(applicationContext)
    MapsInitializer.initialize(this, MapsInitializer.Renderer.LATEST, {})
    Log.d("ddddddddddddddddd","d")

    // Setup ARCore session lifecycle helper and configuration.
           arCoreSessionHelper = ARCoreSessionLifecycleHelper(this)
           // If Session creation or Session.resume() fails, display a message and log detailed
           // information.
           arCoreSessionHelper.exceptionCallback =
             { exception ->
               val message =
                 when (exception) {
                   is UnavailableUserDeclinedInstallationException ->
                     "Please install Google Play Services for AR"
                   is UnavailableApkTooOldException -> "Please update ARCore"
                   is UnavailableSdkTooOldException -> "Please update this app"
                   is UnavailableDeviceNotCompatibleException -> "This device does not support AR"
                   is CameraNotAvailableException -> "Camera not available. Try restarting the app."
                   else -> "Failed to create AR session: $exception"
                 }
               Log.e(TAG, "ARCore threw an exception", exception)
               view.snackbarHelper.showError(this, message)
             }

           // Configure session features.
           arCoreSessionHelper.beforeSessionResume = ::configureSession
           lifecycle.addObserver(arCoreSessionHelper)

           // Set up the Hello AR renderer.
           renderer = HelloGeoRenderer(this)
           lifecycle.addObserver(renderer)

           // Set up Hello AR UI.
           view = HelloGeoView(this)
           lifecycle.addObserver(view)
           setContentView(view.root)

           // Sets up an example renderer using our HelloGeoRenderer.
           SampleRender(view.surfaceView, renderer, assets)
    val heightIncreaseButton = findViewById<Button>(R.id.heightIncrease)

    heightIncreaseButton.setOnClickListener {
            manualAltitude += 0.25
            renderer.onMapClick(cameralatLng, manualAltitude, false)
          }

    val heightDecreaseButton = findViewById<Button>(R.id.heightDecrease)
    heightDecreaseButton.setOnClickListener {
      manualAltitude -= 0.25
      renderer.onMapClick(cameralatLng, manualAltitude, false)
    }

    val showResultButton = findViewById<Button>(R.id.showResult)
    showResultButton.setOnClickListener {
      Toast.makeText(this, "latitude: ${cameralatLng.latitude} longitude:${cameralatLng.longitude} altitude: {$manualAltitude}", Toast.LENGTH_LONG).show()
    }

  }


  // Configure the session, setting the desired options according to your usecase.
  fun configureSession(session: Session) {
    session.configure(
      session.config.apply {
        geospatialMode = Config.GeospatialMode.ENABLED
      }
    )
  }

  override fun onRequestPermissionsResult(
    requestCode: Int,
    permissions: Array<String>,
    results: IntArray
  ) {
    super.onRequestPermissionsResult(requestCode, permissions, results)
    if (!GeoPermissionsHelper.hasGeoPermissions(this)) {
      // Use toast instead of snackbar here since the activity will exit.
      Toast.makeText(this, "Camera and location permissions are needed to run this application", Toast.LENGTH_LONG)
        .show()
      if (!GeoPermissionsHelper.shouldShowRequestPermissionRationale(this)) {
        // Permission denied with checking "Do not ask again".
        GeoPermissionsHelper.launchPermissionSettings(this)
      }
      finish()
    }
  }

  override fun onWindowFocusChanged(hasFocus: Boolean) {
    super.onWindowFocusChanged(hasFocus)
    FullScreenHelper.setFullScreenOnWindowFocusChanged(this, hasFocus)
  }


}
