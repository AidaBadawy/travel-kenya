class PlaceModel {
  final String image;
  final String location;
  final String description;
  final List<String> tags;

  PlaceModel({
    required this.image,
    required this.location,
    required this.description,
    required this.tags,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        image: json["image"],
        location: json["location"],
        description: json["description"],
        tags: List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "location": location,
        "description": description,
        "tags": List<dynamic>.from(tags.map((x) => x))
      };
}
