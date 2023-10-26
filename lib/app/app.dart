import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/services/chat_service.dart';
import 'package:travel_kenya/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:travel_kenya/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:travel_kenya/ui/views/home/home_view.dart';
import 'package:travel_kenya/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_kenya/ui/views/explore/explore_view.dart';
import 'package:travel_kenya/ui/views/events/events_view.dart';
import 'package:travel_kenya/ui/views/activity/activity_view.dart';
import 'package:travel_kenya/ui/views/trip/trip_view.dart';
import 'package:travel_kenya/ui/views/onboarding/onboarding_view.dart';
import 'package:travel_kenya/services/home_service.dart';
import 'package:travel_kenya/ui/views/message/message_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ExploreView),
    MaterialRoute(page: EventsView),
    CustomRoute(page: ActivityView),
    MaterialRoute(page: TripView),
    MaterialRoute(page: OnboardingView),
    CustomRoute(page: MessageView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HomeService),
    LazySingleton(classType: ChatService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
