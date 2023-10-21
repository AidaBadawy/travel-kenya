import 'package:stacked/stacked.dart';
import 'package:travel_kenya/app/app.locator.dart';
import 'package:travel_kenya/model/place_model.dart';
import 'package:travel_kenya/services/home_service.dart';

class ExploreViewModel extends ReactiveViewModel {
  final _homeService = locator<HomeService>();

  bool _isMasonry = false;
  bool get isMasonry => _isMasonry;

  List<PlaceModel> get placesList => _homeService.placesList;

  setMasonry() {
    _isMasonry = !_isMasonry;
    notifyListeners();
  }
}
