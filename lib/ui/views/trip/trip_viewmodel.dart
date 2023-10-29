import 'package:stacked_services/stacked_services.dart';
import 'package:travel_kenya/app/app.router.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/model/place_model.dart';
import 'package:travel_kenya/model/trip_model.dart';
import 'package:travel_kenya/ui/common/enums.dart';

class TripViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _homeService = locator<HomeService>();

  List<TripModel> get tripList => _homeService.tripList;
  List<PlaceModel> get placeList => _homeService.placesList;

  TripType _tripType = TripType.personal;
  TripType get tripType => _tripType;

  List<String> tabList = ["Personal", "Group"];

  List<TripModel> _tripListData = [];
  List<TripModel> get tripListData => _tripListData;

  PlaceModel _selectedPlace = PlaceModel(
      id: "",
      name: "",
      description: "",
      location: LocationModel(latitude: 0, longitude: 0),
      image: "");
  PlaceModel get selectedPlace => _selectedPlace;

  initTrip() {
    _tripListData = tripList
        .where((element) => element.tripType == TripType.personal)
        .toList();
  }

  setTripType(TripType value) {
    _tripType = value;

    _tripListData =
        tripList.where((element) => element.tripType == value).toList();

    notifyListeners();
  }

  setSelectedPlace(PlaceModel place) {
    _selectedPlace = place;
    notifyListeners();
  }

  navigateToAddTrip() async {
    await _navigationService.navigateTo(
      Routes.addTripView,
      transition: TransitionsBuilders.slideLeftWithFade,
    );
    notifyListeners();
  }

  // static Future<List<Map<String, String>>> getSuggestions(String query) async {
  //   await Future<void>.delayed(const Duration(seconds: 1));

  //   return List.generate(3, (index) {
  //     return {
  //       'name': query + index.toString(),
  //       'price': Random().nextInt(100).toString()
  //     };
  //   });
  // }

  List<PlaceModel> getSuggestions(String query) {
    List<PlaceModel> matches = placeList.toList();
    // matches.addAll(placeList);

    matches
        .retainWhere((s) => s.name.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _homeService,
      ];
}
