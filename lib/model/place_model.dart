class PlaceModel {
  final String id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;

  PlaceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
      };
}
