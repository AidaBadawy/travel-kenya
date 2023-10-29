import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/ui/common/enums.dart';

class EventsViewModel extends ReactiveViewModel {
  final _homeService = locator<HomeService>();

  bool _isMasonry = false;
  bool get isMasonry => _isMasonry;

  List<CategoryModel> get eventsList => _homeService.categoryList
      .where((element) => element.categoryType == CategoryType.event)
      .toList();

  setMasonry() {
    _isMasonry = !_isMasonry;
    notifyListeners();
  }
}
