import 'package:travel_kenya/model/message_model.dart';

class ChatModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final MessageModel lastMessage;

  ChatModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.lastMessage});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        lastMessage: MessageModel.fromJson(json["last_message"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "last_message": lastMessage.toJson(),
      };
}
