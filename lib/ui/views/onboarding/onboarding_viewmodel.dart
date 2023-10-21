import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_kenya/app/app.locator.dart';
import 'package:travel_kenya/ui/common/app_images.dart';
import 'package:travel_kenya/ui/views/home/home_view.dart';

class OnboardingViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();

  final List<String> onBoardingList = [
    imLion,
    imMaasai,
    imBallon,
    imBuilding,
  ];

  bool _displayTwo = false;
  bool get displayTwo => _displayTwo;

  bool _displayThree = false;
  bool get displayThree => _displayThree;

  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;

  setCurrentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  setDisplayTwo(bool value) {
    _displayTwo = value;
    notifyListeners();
  }

  setDisplayThree(bool value) {
    _displayThree = value;
    notifyListeners();
  }

  navigateToHome() {
    _navigationService.replaceWithTransition(const HomeView(),
        transitionStyle: Transition.rightToLeftWithFade);
  }
}
