class LocationModel {
  final String code;
  final String name;

  LocationModel({required this.code, required this.name});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(code: json['code'], name: json['name']);
  }
}
