import 'package:flutter/material.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/ui/widgets/featured_card.dart';

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
      backgroundColor: theme.colorScheme.background,
      drawer: const AppDrawer(),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onBackground),
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
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
                        builder: (BuildContext context,
                            SearchController controller) {
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
                            elevation:
                                MaterialStateProperty.resolveWith<double?>(
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                        suggestionsBuilder: (BuildContext context,
                            SearchController controller) {
                          // if (controller.text.isEmpty) {
                          //   return List.generate(
                          //     0,
                          //     (int index) {
                          //       return Container();
                          //     },
                          //   );
                          // }
                          return List<ListTile>.generate(
                            viewModel.getSuggestions(controller.text).length,
                            (int index) {
                              final String item = viewModel
                                  .getSuggestions(controller.text)[index]
                                  .title;
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
              ),
              // verticalSpaceMedium,
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: ManropeText.semiBold(
              //       "Upcoming Trips", 18, theme.colorScheme.onBackground),
              // ),
              // verticalSpaceSmall,
              // verticalSpaceTiny,
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(children: [
              //     Expanded(
              //       child: InkWell(
              //         borderRadius: BorderRadius.circular(25),
              //         onTap: () {
              //           viewModel.setTripType(TripType.personal);
              //         },
              //         child: Container(
              //           height: 50,
              //           padding: const EdgeInsets.all(10),
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(25),
              //             color: viewModel.tripType == TripType.personal
              //                 ? theme.colorScheme.primary
              //                 : theme.colorScheme.background,
              //             border: Border.all(
              //               color: theme.colorScheme.primary,
              //             ),
              //           ),
              //           child: ManropeText.medium(
              //               viewModel.tabList.first,
              //               16,
              //               viewModel.tripType != TripType.personal
              //                   ? theme.colorScheme.primary
              //                   : theme.colorScheme.background),
              //         ),
              //       ),
              //     ),
              //     horizontalSpaceSmall,
              //     Expanded(
              //       child: InkWell(
              //         borderRadius: BorderRadius.circular(25),
              //         onTap: () {
              //           viewModel.setTripType(TripType.group);
              //         },
              //         child: Container(
              //           height: 50,
              //           padding: const EdgeInsets.all(10),
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(25),
              //             color: viewModel.tripType == TripType.group
              //                 ? theme.colorScheme.primary
              //                 : theme.colorScheme.background,
              //             border: Border.all(
              //               color: theme.colorScheme.primary,
              //             ),
              //           ),
              //           child: ManropeText.medium(
              //               viewModel.tabList.last,
              //               16,
              //               viewModel.tripType != TripType.group
              //                   ? theme.colorScheme.primary
              //                   : theme.colorScheme.background),
              //         ),
              //       ),
              //     ),
              //   ]),
              // ),
              // verticalSpaceSmall,
              // verticalSpaceTiny,
              // SizedBox(
              //   height: 280,
              //   child: ListView.separated(
              //       padding: const EdgeInsets.only(left: 20),
              //       shrinkWrap: true,
              //       physics: const BouncingScrollPhysics(),
              //       scrollDirection: Axis.horizontal,
              //       itemCount: viewModel.tripListData.length,
              //       separatorBuilder: (context, index) {
              //         return horizontalSpaceSmall;
              //       },
              //       itemBuilder: (context, index) {
              //         return TripCardTwo(
              //           trip: viewModel.tripListData[index],
              //           cardColor: theme.colorScheme.primary,
              //           isLast: index == viewModel.tripListData.length - 1,
              //           textColor: theme.colorScheme.background,
              //         );
              //       }),
              // ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ManropeText.semiBold(
                    "Categories", 18, theme.colorScheme.onBackground),
              ),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
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
                            ? theme.colorScheme.primary
                            : Colors.grey.shade300,
                        iconColor: index == viewModel.selectedCategoryInt
                            ? theme.colorScheme.background
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpaceMedium,
              SizedBox(
                height: 110,
                child: ListView.separated(
                  padding: const EdgeInsets.only(left: 20),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      place: viewModel.categoryList[index],
                      isLast: index == viewModel.categoryList.length - 1,
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
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ManropeText.semiBold(
                    "Inspiration", 18, theme.colorScheme.onBackground),
              ),
              verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ManropeText.regular(
                    "Curated travel content, destination highlights, to inspire users and encourage exploration",
                    14,
                    theme.colorScheme.onBackground),
              ),
              verticalSpaceSmall,
              SizedBox(
                height: 245,
                child: ListView.separated(
                    padding: const EdgeInsets.only(left: 20),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.tripList.length,
                    separatorBuilder: (context, index) {
                      return horizontalSpaceSmall;
                    },
                    itemBuilder: (context, index) {
                      return FeaturedCard(
                        trip: viewModel.tripList[index],
                        cardColor: theme.colorScheme.primary,
                        isLast: index == viewModel.tripList.length - 1,
                        viewModel: viewModel,
                        textColor: theme.colorScheme.background,
                      );
                    }),
              ),
              verticalSpaceMedium
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
