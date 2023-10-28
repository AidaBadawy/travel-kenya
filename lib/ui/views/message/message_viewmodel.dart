import 'package:stacked/stacked.dart';
import 'package:travel_kenya/app/app.locator.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/model/chat_grid_model.dart';
import 'package:travel_kenya/model/message_model.dart';
import 'package:travel_kenya/services/chat_service.dart';

class MessageViewModel extends ReactiveViewModel {
  final _chatService = locator<ChatService>();

  List<MessageModel> get messageList => _chatService.messageList;

  String myUserId = "111";

  bool _isMaxLineExceeded = false;
  bool get isMaxLineExceeded => _isMaxLineExceeded;

  bool _isTyping = false;
  bool get isTyping => _isTyping;

  bool _isKeyboardOpen = false;
  bool get isKeyboardOpen => _isKeyboardOpen;

  bool _isPlusTapped = false;
  bool get isPlusTapped => _isPlusTapped;

  List<ChatGridModel> gridList = [
    ChatGridModel(title: "Camera", image: icCamera),
    ChatGridModel(title: "Gallery", image: icGallery),
    ChatGridModel(title: "Document", image: icFolder),
    ChatGridModel(title: "Location", image: icMapPin),
    ChatGridModel(title: "Polls", image: icPolls),
    ChatGridModel(title: "Camera", image: icPolls),
  ];

  initMessageView() {
    // messageList.reversed.toList();
    notifyListeners();
  }

  setIsMessageTyping(String value) {
    _isMaxLineExceeded = value.split("\n").length > 4;
    _isTyping = value.isNotEmpty;

    notifyListeners();
  }

  setKeyboardOpen(bool value) {
    _isKeyboardOpen = value;
  }

  setPlusTapped() {
    _isPlusTapped = !_isPlusTapped;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _chatService,
      ];
}
