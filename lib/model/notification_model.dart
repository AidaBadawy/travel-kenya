import 'package:travel_kenya/ui/common/enums.dart';

class NotificationModel {
  final String id;
  final String title;
  final String image;
  final String description;
  final NotificationType notificationType;
  final DateTime date;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.notificationType,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        notificationType: NotificationType.values.firstWhere(
          (notificationType) =>
              notificationType.toString() ==
              'NotificationType.${json['notification_type']}',
        ),
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        'notification_type': notificationType.toString().split('.').last,
        "date": date,
      };
}
