import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:travel_kenya/app/app.bottomsheets.dart';
import 'package:travel_kenya/app/app.dialogs.dart';
import 'package:travel_kenya/app/app.locator.dart';
import 'package:travel_kenya/app/app.router.dart';
import 'package:travel_kenya/model/place_model.dart';
import 'package:travel_kenya/ui/common/app_images.dart';
import 'package:travel_kenya/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel_kenya/ui/views/activity/activity_view.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  bool _isRevealed = false;
  bool get isRevealed => _isRevealed;

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

  List<PlaceModel> placesList = [
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1669335358428-4e9cf47859df?auto=format&fit=crop&q=80&w=2942&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      location: "Watamu Beach",
      description: "",
      tags: ["Beach"],
    ),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1623317977555-5be922ef3f5f?auto=format&fit=crop&q=80&w=2874&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      location: "Pirates Beach",
      description: "",
      tags: ["Beach"],
    ),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1672651745723-d0b2b962a7f3?auto=format&fit=crop&q=80&w=2940&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      location: "Hells Gate",
      description: "",
      tags: ["Scenery"],
    ),
    PlaceModel(
        image:
            "https://images.unsplash.com/photo-1696231659533-bdb81ffaa661?auto=format&fit=crop&q=80&w=2940&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        location: "Maasai Mara",
        description: "",
        tags: ["Scenery"]),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1616431505321-8adf35f76a58?auto=format&fit=crop&q=80&w=2891&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      location: "Nakuru Park",
      description: "",
      tags: ["Adventure"],
    ),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1696231659224-238807a99a06?auto=format&fit=crop&q=80&w=2940&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      location: "Maasai Mara",
      description: "",
      tags: ["Adventure"],
    ),
    PlaceModel(
      image:
          "https://images.unsplash.com/photo-1623745493572-ef78d94249f3?auto=format&fit=crop&q=80&w=2952&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      location: "Lake Nakuru",
      description: "",
      tags: ["Wildlife"],
    ),
    PlaceModel(
      image:
          'https://images.unsplash.com/photo-1696231657232-a4f296e41b24?auto=format&fit=crop&q=80&w=2940&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      location: "Tsavo Park",
      description: "",
      tags: ["Wildlife"],
    ),
    PlaceModel(
        image:
            "https://images.unsplash.com/photo-1504616516087-fca44d1f8737?auto=format&fit=crop&q=80&w=2500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        location: "Maasai Mara",
        description: "",
        tags: ["Wildlife"]),
    PlaceModel(
        image:
            "https://images.unsplash.com/photo-1515658323406-25d61c141a6e?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGtlbnlhJTIwY3VsdHVyZXxlbnwwfHwwfHx8MA%3D%3D",
        location: "Maasai Culture",
        description: "",
        tags: ["Culture"]),
    PlaceModel(
        image:
            "https://images.unsplash.com/photo-1602094777645-5701b6128003?auto=format&fit=crop&q=80&w=2934&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        location: "Lamu Culture",
        description: "",
        tags: ["Culture"])
  ];

  int _selectedCategoryInt = 0;
  int get selectedCategoryInt => _selectedCategoryInt;

  List<PlaceModel> _categoryList = [];
  List<PlaceModel> get categoryList => _categoryList;

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

  navigateToActivityPage() {
    _navigationService.navigateWithTransition(const ActivityView(),
        transitionStyle: Transition.rightToLeft);
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
    print("hapa");
    print(_isRevealed);
  }
}
