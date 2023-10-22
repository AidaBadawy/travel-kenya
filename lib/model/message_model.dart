import 'package:travel_kenya/model/user_model.dart';
import 'package:travel_kenya/ui/common/enums.dart';

class MessageModel {
  final String id;
  final String message;
  final DateTime date;
  final List<String> attachment;
  final MessageType messageType;
  final UserModel sender;
  final bool? isDeleted;

  MessageModel({
    required this.id,
    required this.message,
    required this.attachment,
    required this.date,
    required this.messageType,
    required this.sender,
    this.isDeleted,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["id"],
        message: json["message"],
        date: json["date"],
        attachment: List<String>.from(json["attachment"].map((x) => x)),
        sender: UserModel.fromJson(json["sender"]),
        messageType: MessageType.values.firstWhere(
          (messageType) =>
              messageType.toString() == 'MessageType.${json['message_type']}',
        ),
        isDeleted: json["is_deleted"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "date": date.toIso8601String(),
        "attachment": List<dynamic>.from(attachment.map((x) => x)),
        "sender": sender.toJson(),
        'message_type': messageType.toString().split('.').last,
        "is_deleted": isDeleted,
      };
}
