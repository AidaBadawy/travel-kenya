import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_kenya/app/app.locator.dart';
import 'package:travel_kenya/app/app.router.dart';
import 'package:travel_kenya/model/chat_model.dart';
import 'package:travel_kenya/model/notification_model.dart';
import 'package:travel_kenya/services/chat_service.dart';
import 'package:travel_kenya/services/home_service.dart';

class ActivityViewModel extends ReactiveViewModel {
  final _chatService = locator<ChatService>();
  final _homeService = locator<HomeService>();
  final _navigationService = locator<NavigationService>();

  List<ChatModel> get chatList => _chatService.chatList;
  List<NotificationModel> get notificationList => _homeService.notificationList;

  navigateToMessagePage(ChatModel chat) async {
    await _navigationService.navigateTo(
      Routes.messageView,
      arguments: MessageViewArguments(chat: chat),
      transition: TransitionsBuilders.slideLeftWithFade,
    );
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _chatService,
        _homeService,
      ];
}
