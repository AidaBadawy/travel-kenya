import 'package:travel_kenya/model/place_model.dart';
import 'package:travel_kenya/ui/common/enums.dart';

class CategoryModel {
  final DateTime? date;
  final String title;
  final String description;
  final List<String> tags;
  final List<String> images;
  final PlaceModel place;
  final CategoryType categoryType;

  CategoryModel({
    this.date,
    required this.title,
    required this.description,
    required this.tags,
    required this.images,
    required this.place,
    required this.categoryType,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        date: json["date"] ?? DateTime.now(),
        title: json["title"],
        description: json["description"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        images: List<String>.from(json["tags"].map((x) => x)),
        place: PlaceModel.fromJson(json["place"]),
        categoryType: CategoryType.values.firstWhere(
          (category) =>
              category.toString() == 'CategoryType.${json['category_type']}',
        ),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "title": title,
        "description": description,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "place": place.toJson(),
        'category_type': categoryType.toString().split('.').last,
      };
}
