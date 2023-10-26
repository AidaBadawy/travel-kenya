import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:travel_kenya/app/app.bottomsheets.dart';
import 'package:travel_kenya/app/app.dialogs.dart';
import 'package:travel_kenya/app/app.router.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _homeService = locator<HomeService>();

  List<CategoryModel> get placesList => _homeService.placesList;

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  bool _isRevealed = false;
  bool get isRevealed => _isRevealed;

  final TextEditingController searchController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> keyController = GlobalKey();

  List<String> iconList = [
    icBeach,
    icSunset,
    icTent,
    icWildlife,
    icCulture,
  ];

  List imageList = [
    "https://images.unsplash.com/photo-1489392191049-fc10c97e64b6?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8a2VueWF8ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8a2VueWF8ZW58MHx8MHx8fDA%3D",
  ];

  int _selectedCategoryInt = 0;
  int get selectedCategoryInt => _selectedCategoryInt;

  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;

  initHome() {
    _categoryList =
        placesList.where((element) => element.tags.contains("Beach")).toList();
  }

  setSelectedCategory(int index) {
    _selectedCategoryInt = index;

    switch (index) {
      case 0:
        _categoryList = placesList
            .where((element) => element.tags.contains("Beach"))
            .toList();
        break;
      case 1:
        _categoryList = placesList
            .where((element) => element.tags.contains("Scenery"))
            .toList();
        break;
      case 2:
        _categoryList = placesList
            .where((element) => element.tags.contains("Adventure"))
            .toList();

        break;
      case 3:
        _categoryList = placesList
            .where((element) => element.tags.contains("Wildlife"))
            .toList();
        break;
      case 4:
        _categoryList = placesList
            .where((element) => element.tags.contains("Culture"))
            .toList();
        break;
      default:
    }

    notifyListeners();
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  navigateToActivityPage() async {
    await _navigationService.navigateTo(
      Routes.activityView,
      transition: TransitionsBuilders.slideLeftWithFade,
    );
  }

  navigateToExplorePage(context) {
    _navigationService.replaceWithExploreView();
    Scaffold.of(context).openEndDrawer();
  }

  navigateToHomePage(context) {
    _navigationService.replaceWithHomeView();
    Scaffold.of(context).openEndDrawer();
  }

  navigateToEventsPage(context) {
    _navigationService.replaceWithEventsView();
    Scaffold.of(context).openEndDrawer();
  }

  navigateToTripsPage(context) {
    _navigationService.replaceWithTripView();
    Scaffold.of(context).openEndDrawer();
  }

  toggleDarkLightMode(context) {
    getThemeManager(context).toggleDarkLightTheme();
    notifyListeners();
  }

  setIsRevealed() {
    _isRevealed = !_isRevealed;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _homeService,
      ];
}
