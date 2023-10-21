import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:travel_kenya/ui/common/app_colors.dart';
import 'package:travel_kenya/ui/common/app_images.dart';
import 'package:travel_kenya/ui/common/box_text.dart';
import 'package:travel_kenya/ui/common/ui_helpers.dart';
import 'package:travel_kenya/ui/widgets/app_drawer.dart';
import 'package:travel_kenya/ui/widgets/category_widget.dart';
import 'package:travel_kenya/ui/widgets/icon_widget.dart';
import 'package:travel_kenya/ui/widgets/search_bar.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBlack,
      drawer: const AppDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kcBlack,
        title: ManropeText.medium("Travel Kenya", 18, kcWhite),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              viewModel.navigateToActivityPage();
            },
            icon: SvgPicture.asset(
              icMessagePlus,
              color: kcWhite,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: AutoCompleteSearch(),
                ),
                const SizedBox(width: 5),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: IconButton(
                      onPressed: () {
                        viewModel.showBottomSheet();
                      },
                      icon: const Icon(Icons.tune),
                      color: Colors.white,
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
              height: 100,
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
