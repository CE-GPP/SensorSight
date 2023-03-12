class MarkerData {
  String? name;
  double? latitude;
  double? longitude;

  MarkerData(
      {required this.name, required this.latitude, required this.longitude});

  factory MarkerData.fromJson(Map<String, dynamic> json) {
    return MarkerData(
      name: json['name'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
    );
  }
}
