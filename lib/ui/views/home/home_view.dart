import 'package:flutter/material.dart';
import 'package:travel_kenya/app/app_export.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const AppDrawer(),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onBackground),
        // backgroundColor: kcBlack,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: ManropeText.medium(
            "Travel Kenya", 18, theme.colorScheme.onBackground),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => viewModel.navigateToActivityPage(),
            icon: SvgPicture.asset(
              icMessagePlus,
              color: theme.colorScheme.onBackground,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SearchAnchor(
                      viewHintText: "Search places...",
                      viewLeading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      builder:
                          (BuildContext context, SearchController controller) {
                        return SearchBar(
                          hintText: "Search places...",
                          hintStyle:
                              MaterialStateProperty.resolveWith((states) {
                            return manropeRegular.copyWith(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant);
                          }),
                          elevation: MaterialStateProperty.resolveWith<double?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return 8.0; // Increase elevation when pressed
                              } else {
                                return 2.0; // Default elevation for other states
                              }
                            },
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              return Theme.of(context).colorScheme.background;
                            },
                          ),
                          controller: controller,
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0)),
                          onTap: () {
                            controller.openView();
                          },
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (_) {
                            controller.openView();
                          },
                          leading: const Icon(Icons.search),
                        );
                      },
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                        if (controller.text.isEmpty) {
                          return List.generate(
                            0,
                            (int index) {
                              return Container();
                            },
                          );
                        }
                        return List<ListTile>.generate(
                          5,
                          (int index) {
                            final String item = 'item searching $index';
                            return ListTile(
                              title: Text(item),
                              onTap: () {
                                // setState(() {
                                controller.closeView(item);
                                // FocusScope.of(context).requestFocus(FocusNode());

                                // });
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  verticalSpaceTiny,
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: IconButton(
                        onPressed: () {
                          viewModel.showBottomSheet();
                        },
                        icon: const Icon(Icons.tune),
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  )
                ],
              ),
              verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  viewModel.iconList.length,
                  (index) => InkWell(
                    borderRadius: BorderRadius.circular(28),
                    onTap: () {
                      viewModel.setSelectedCategory(index);
                    },
                    child: IconWidget(
                      radius: 28,
                      height: 26,
                      image: viewModel.iconList[index],
                      bgColor: index == viewModel.selectedCategoryInt
                          ? Colors.brown
                          : Colors.grey.shade300,
                      iconColor: index == viewModel.selectedCategoryInt
                          ? kcWhite
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              verticalSpaceMedium,
              SizedBox(
                height: 110,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      place: viewModel.categoryList[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 15,
                    );
                  },
                  itemCount: viewModel.categoryList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.initHome();
    super.onViewModelReady(viewModel);
  }
}
