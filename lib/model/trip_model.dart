import 'package:travel_kenya/model/place_model.dart';
import 'package:travel_kenya/model/user_model.dart';
import 'package:travel_kenya/ui/common/enums.dart';

class TripModel {
  final String id;
  final String title;
  final String image;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final PlaceModel place;
  final List<TripExpense> expense;
  final List<TripActivity> activities;
  final List<UserModel> users;
  final TripType tripType;
  final List<String> tags;

  TripModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.expense,
    required this.activities,
    required this.users,
    required this.tripType,
    required this.tags,
    required this.place,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        place: PlaceModel.fromJson(json["place"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        tripType: TripType.values.firstWhere(
          (tripType) => tripType.toString() == 'TripType.${json['trip_type']}',
        ),
        expense: List<TripExpense>.from(json["expense"].map(
          (x) => TripExpense.fromJson(x),
        )),
        activities: List<TripActivity>.from(json["expense"].map(
          (x) => TripActivity.fromJson(x),
        )),
        users: List<UserModel>.from(
          json["users"].map(
            (x) => UserModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "place": place.toJson(),
        "description": description,
      };
}

class TripExpense {
  final String id;
  // final String tripId;
  final String name; // Name or description of the expense.
  final double amount; // Cost of the expense.

  TripExpense({
    required this.id,
    // required this.tripId,
    required this.name,
    required this.amount,
  });

  factory TripExpense.fromJson(Map<String, dynamic> json) => TripExpense(
        id: json["id"],
        // tripId: json["trip_id"],
        name: json["name"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        // "trip_id": tripId,
        "name": name,
        "amount": amount,
      };
}

class TripActivity {
  final String id;
  final String name; // Name or description of the activity.
  final DateTime date; // Date of the activity.
  final LocationModel location; // Location or venue of the activity.

  TripActivity({
    required this.id,
    required this.name,
    required this.date,
    required this.location,
  });

  factory TripActivity.fromJson(Map<String, dynamic> json) => TripActivity(
      id: json["id"],
      name: json["name"],
      date: json["date"],
      location: LocationModel.fromJson(json["location"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date": date,
        "amount": location.toJson(),
      };
}
