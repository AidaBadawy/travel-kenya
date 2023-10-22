import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:travel_kenya/ui/views/home/home_viewmodel.dart';

class AutoCompleteSearch extends StackedView<HomeViewModel> {
  const AutoCompleteSearch({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    // Size size = MediaQuery.of(context).size;
    // bool isDark = getThemeManager(context).isDarkMode;
    var theme = Theme.of(context);

    return AutoCompleteTextField(
      controller: viewModel.searchController,
      suggestions: const ["places"],
      key: viewModel.keyController,
      clearOnSubmit: false,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () => viewModel.searchController.clear(),
            icon: Icon(Icons.clear,
                color: viewModel.searchController.text.isNotEmpty
                    ? Colors.white
                    : Colors.transparent)),
        //_getClearButton(),
        prefixIcon: Icon(Icons.search, color: theme.colorScheme.onBackground),
        hintStyle: TextStyle(color: theme.colorScheme.onBackground),
        hintText: 'Search Places...',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:
              BorderSide(color: theme.colorScheme.onBackground, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:
              BorderSide(color: theme.colorScheme.onBackground, width: 1),
        ),
      ),
      itemFilter: (String? item, query) {
        return item!.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (String? a, String b) {
        return a!.compareTo(b);
      },
      itemSubmitted: (String item) {
        viewModel.searchController.text = item;
        // Get.to(
        //   () => SearchPage(),
        //   transition: Transition.fadeIn,
        //   arguments: {
        //     'title': item,
        //   },
        // );
      },
      itemBuilder: (BuildContext context, String item) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Text(item, style: const TextStyle(color: Colors.black)),
            ],
          ),
        );
      },
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
