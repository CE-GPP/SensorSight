class Camera {
  final int id;
  final String name;
  final double lon;
  final double lat;
  final double elevation;
  final String manufacturer;
  final String series;
  final String resolution;
  final String feedLink;
  final String imageLink;
  final String fullImageLink;
  final CameraCoordinates cameraCoordinates;
  final CameraCoordinates columnBaseCoordinates;
  final VisionField visionField1;
  final VisionField visionField2;

  Camera({
    required this.id,
    required this.name,
    required this.lon,
    required this.lat,
    required this.elevation,
    required this.manufacturer,
    required this.series,
    required this.resolution,
    required this.feedLink,
    required this.imageLink,
    required this.fullImageLink,
    required this.cameraCoordinates,
    required this.columnBaseCoordinates,
    required this.visionField1,
    required this.visionField2,
  });

  factory Camera.fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String name = json['name'];
    double lon = json['lon']?.toDouble() ?? 0.0;
    double lat = json['lat']?.toDouble() ?? 0.0;
    double elevation = json['elevation']?.toDouble() ?? 0.0;
    String manufacturer = json['manufacturer'];
    String series = json['series'];
    String resolution = json['resolution'];
    String feedLink = json['feed_link'];
    String imageLink = json['image_link'] ?? '';
    String fullImageLink = json['full_image_link'] ?? '';

    CameraCoordinates cameraCoordinates =
        CameraCoordinates.fromJson(json['camera_coordinates'] ?? {});
    CameraCoordinates columnBaseCoordinates =
        CameraCoordinates.fromJson(json['column_base_coordinates'] ?? {});
    VisionField visionField1 =
        VisionField.fromJson(json['vision_field_1'] ?? {});
    VisionField visionField2 =
        VisionField.fromJson(json['vision_field_2'] ?? {});

    // Check for null or missing required properties
    if (id == null) {
      throw FormatException(
          "Missing or null required property: id in Camera.fromJson");
    }

    if (name == null) {
      throw FormatException(
          "Missing or null required property: name in Camera.fromJson");
    }

    if (lon == null) {
      throw FormatException(
          "Missing or null required property: lon in Camera.fromJson");
    }

    if (lat == null) {
      throw FormatException(
          "Missing or null required property: lat in Camera.fromJson");
    }

    if (elevation == null) {
      throw FormatException(
          "Missing or null required property: elevation in Camera.fromJson");
    }

    if (manufacturer == null) {
      throw FormatException(
          "Missing or null required property: manufacturer in Camera.fromJson");
    }

    if (series == null) {
      throw FormatException(
          "Missing or null required property: series in Camera.fromJson");
    }

    if (resolution == null) {
      throw FormatException(
          "Missing or null required property: resolution in Camera.fromJson");
    }

    if (feedLink == null) {
      throw FormatException(
          "Missing or null required property: feedLink in Camera.fromJson");
    }

    if (imageLink == null) {
      throw FormatException(
          "Missing or null required property: imageLink in Camera.fromJson");
    }

    if (cameraCoordinates == null) {
      throw FormatException(
          "Missing or null required property: cameraCoordinates in Camera.fromJson");
    }

    if (columnBaseCoordinates == null) {
      throw FormatException(
          "Missing or null required property: columnBaseCoordinates in Camera.fromJson");
    }

    if (visionField1 == null) {
      throw FormatException(
          "Missing or null required property: visionField1 in Camera.fromJson");
    }

    if (visionField2 == null) {
      throw FormatException(
          "Missing or null required property: visionField2 in Camera.fromJson");
    }

    return Camera(
      id: id,
      name: name,
      lon: lon,
      lat: lat,
      elevation: elevation,
      manufacturer: manufacturer,
      series: series,
      resolution: resolution,
      feedLink: feedLink,
      imageLink: imageLink,
      fullImageLink: fullImageLink,
      cameraCoordinates: cameraCoordinates,
      columnBaseCoordinates: columnBaseCoordinates,
      visionField1: visionField1,
      visionField2: visionField2,
    );
  }
}

class CameraCoordinates {
  final double alt;
  final double lat;
  final double lon;

  CameraCoordinates({required this.alt, required this.lat, required this.lon});

  factory CameraCoordinates.fromJson(Map<String, dynamic> json) {
    double? alt = json['alt'];
    double? lat = json['lat'];
    double? lon = json['lon'];

    if (alt == null) {
      throw FormatException(
          "Missing or null required property: alt in CameraCoordinates.fromJson");
    }

    if (lat == null) {
      throw FormatException(
          "Missing or null required property: lat in CameraCoordinates.fromJson");
    }

    if (lon == null) {
      throw FormatException(
          "Missing or null required property: lon in CameraCoordinates.fromJson");
    }

    return CameraCoordinates(
      alt: alt,
      lat: lat,
      lon: lon,
    );
  }
}

class VisionField {
  final double alt;
  final double lat;
  final double lon;

  VisionField({required this.alt, required this.lat, required this.lon});

  factory VisionField.fromJson(Map<String, dynamic> json) {
    double? alt = json['alt'];
    double? lat = json['lat'];
    double? lon = json['lon'];

    if (alt == null) {
      throw FormatException(
          "Missing or null required property: alt in VisionField.fromJson");
    }

    if (lat == null) {
      throw FormatException(
          "Missing or null required property: lat in VisionField.fromJson");
    }

    if (lon == null) {
      throw FormatException(
          "Missing or null required property: lon in VisionField.fromJson");
    }

    return VisionField(
      alt: alt,
      lat: lat,
      lon: lon,
    );
  }
}
