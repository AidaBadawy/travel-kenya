import 'package:stacked/stacked.dart';
import 'package:travel_kenya/app/app.locator.dart';
import 'package:travel_kenya/model/message_model.dart';
import 'package:travel_kenya/services/chat_service.dart';

class MessageViewModel extends ReactiveViewModel {
  final _chatService = locator<ChatService>();

  List<MessageModel> get messageList => _chatService.messageList;

  String myUserId = "111";

  initMessageView() {
    // messageList.reversed.toList();
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _chatService,
      ];
}
