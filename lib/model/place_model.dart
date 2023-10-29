class PlaceModel {
  final String id;
  final String name;
  final String description;
  final LocationModel location;
  final String image;

  PlaceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.image,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        location: LocationModel.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "location": location.toJson(),
      };
}

class LocationModel {
  final double latitude;
  final double longitude;

  LocationModel({
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
