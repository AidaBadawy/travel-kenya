import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/ui/common/enums.dart';

class ExploreViewModel extends ReactiveViewModel {
  final _homeService = locator<HomeService>();

  bool _isMasonry = false;
  bool get isMasonry => _isMasonry;

  List<CategoryModel> get exploreList => _homeService.placesList
      .where((element) => element.categoryType == CategoryType.explore)
      .toList();

  setMasonry() {
    _isMasonry = !_isMasonry;
    notifyListeners();
  }
}
