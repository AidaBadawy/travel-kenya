import 'package:stacked/stacked.dart';
import 'package:travel_kenya/model/chat_model.dart';
import 'package:travel_kenya/model/message_model.dart';
import 'package:travel_kenya/model/user_model.dart';
import 'package:travel_kenya/ui/common/enums.dart';

class ChatService with ListenableServiceMixin {
  DateTime now = DateTime.now();
  List<ChatModel> chatList = [
    ChatModel(
      id: "1",
      name: "Trip to Maasai Mara",
      description: "",
      image:
          "https://images.unsplash.com/photo-1523805009345-7448845a9e53?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGtlbnlhfGVufDB8fDB8fHww",
      lastMessage: MessageModel(
        id: "",
        message:
            "Cupidatat reprehenderit excepteur nostrud laborum. Id fugiat qui consectetur duis. Excepteur mollit eiusmod deserunt nisi exercitation commodo pariatur et ex exercitation. Eiusmod ad veniam ut excepteur consequat minim eiusmod. Enim minim irure do culpa aliqua. Et deserunt reprehenderit esse aute et aute irure occaecat sunt laboris do ullamco aute aliquip. Laborum incididunt sunt ad Lorem ad pariatur.",
        attachment: [],
        date: DateTime.now(),
        messageType: MessageType.text,
        sender: UserModel(
            id: "111",
            name: "Aidarus Badawy",
            image:
                "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
      ),
    ),
    ChatModel(
      id: "2",
      name: "Bird Collection",
      description: "",
      image:
          "https://images.unsplash.com/photo-1535083783855-76ae62b2914e?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGtlbnlhJTIwYmlyZHN8ZW58MHx8MHx8fDA%3D",
      lastMessage: MessageModel(
        id: "",
        message: "Cupidatat reprehenderit ",
        attachment: [],
        date: DateTime.now(),
        messageType: MessageType.text,
        sender: UserModel(
            id: "222",
            name: "Swaleh Alwy",
            image:
                "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
      ),
    ),
    ChatModel(
      id: "3",
      name: "Mount Kenya Hiking",
      description: "",
      image:
          "https://images.unsplash.com/photo-1535703215941-fdfbcb818738?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW91bnQlMjBrZW55YXxlbnwwfHwwfHx8MA%3D%3D",
      lastMessage: MessageModel(
        id: "",
        message:
            "Cupidatat reprehenderit excepteur nostrud laborum. Id fugiat qui consectetur duis. Excepteur mollit eiusmod deserunt nisi exercitation commodo pariatur et ex exercitation. Eiusmod ad veniam ut excepteur consequat minim eiusmod. Enim minim irure do culpa aliqua. Et deserunt reprehenderit esse aute et aute irure occaecat sunt laboris do ullamco aute aliquip. Laborum incididunt sunt ad Lorem ad pariatur.",
        attachment: [],
        date: DateTime.now(),
        messageType: MessageType.text,
        sender: UserModel(
            id: "111",
            name: "Aidarus Badawy",
            image:
                "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
      ),
    ),
  ];

  List<MessageModel> messageList = [
    MessageModel(
      id: "",
      message:
          "last Cupidatat reprehenderit excepteur nostrud laborum. Id fugiat qui consectetur duis. Excepteur mollit eiusmod deserunt nisi exercitation commodo pariatur et ex exercitation. Eiusmod ad veniam ut excepteur consequat minim eiusmod. Enim minim irure do culpa aliqua. Et deserunt reprehenderit esse aute et aute irure occaecat sunt laboris do ullamco aute aliquip. Laborum incididunt sunt ad Lorem ad pariatur.",
      attachment: [],
      date: DateTime.now(),
      messageType: MessageType.text,
      sender: UserModel(
          id: "111",
          name: "Aidarus Badawy",
          image:
              "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    ),
    MessageModel(
      id: "",
      message: "Deserunt ipsum ullamco et culpa sint commodo.",
      attachment: [],
      date: DateTime.now(),
      messageType: MessageType.text,
      sender: UserModel(
          id: "222",
          name: "Swaleh Alwy",
          image:
              "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    ),
    MessageModel(
      id: "",
      message:
          "Cillum enim sit nostrud excepteur aliqua labore ipsum do elit in culpa in culpa.",
      attachment: [],
      date: DateTime.now(),
      messageType: MessageType.text,
      sender: UserModel(
          id: "222",
          name: "Swaleh Alwy",
          image:
              "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    ),
    MessageModel(
      id: "",
      message:
          "Ea minim non aliquip irure nulla esse minim minim dolore non reprehenderit voluptate.",
      attachment: [],
      date: DateTime.now(),
      messageType: MessageType.text,
      sender: UserModel(
          id: "111",
          name: "Aidarus Badawy",
          image:
              "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    ),
    MessageModel(
      id: "",
      message:
          "Cillum enim sit nostrud excepteur aliqua labore ipsum do elit in culpa in culpa.",
      attachment: [],
      date: DateTime.now(),
      messageType: MessageType.text,
      sender: UserModel(
          id: "222",
          name: "Swaleh Alwy",
          image:
              "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    ),
    MessageModel(
      id: "",
      message:
          "Ea minim non aliquip irure nulla esse minim minim dolore non reprehenderit voluptate.",
      attachment: [],
      date: DateTime.now(),
      messageType: MessageType.text,
      sender: UserModel(
          id: "111",
          name: "Aidarus Badawy",
          image:
              "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    ),
    MessageModel(
      id: "",
      message:
          "Cillum enim sit nostrud excepteur aliqua labore ipsum do elit in culpa in culpa.",
      attachment: [],
      date: DateTime.now(),
      messageType: MessageType.text,
      sender: UserModel(
          id: "222",
          name: "Swaleh Alwy",
          image:
              "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?auto=format&fit=crop&q=80&w=2885&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    ),
  ];
}
