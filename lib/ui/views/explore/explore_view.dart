import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:travel_kenya/ui/common/app_images.dart';
import 'package:travel_kenya/ui/common/box_text.dart';
import 'package:travel_kenya/ui/common/ui_helpers.dart';
import 'package:travel_kenya/ui/widgets/app_drawer.dart';
import 'package:travel_kenya/ui/widgets/explore_card.dart';

import 'explore_viewmodel.dart';

class ExploreView extends StackedView<ExploreViewModel> {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ExploreViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.colorScheme.onBackground),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: ManropeText.medium(
            "Explore Kenya", 18, theme.colorScheme.onBackground),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => viewModel.setMasonry(),
            icon: SvgPicture.asset(
              icDashboard,
              color: theme.colorScheme.onBackground,
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: viewModel.isMasonry
          ? AnimationLimiter(
              child: MasonryGridView.count(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: viewModel.placesList.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: ExploreCardTwo(
                          index: index,
                          image: viewModel.placesList[index].image,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : AnimationLimiter(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 605),
                    child: SlideAnimation(
                      horizontalOffset: MediaQuery.of(context).size.width / 2,
                      child: FadeInAnimation(
                        child: ExploreCardOne(
                          titleColor: theme.colorScheme.onBackground,
                          size: size,
                          image: viewModel.placesList[index].image,
                          title: viewModel.placesList[index].location,
                          description: viewModel.placesList[index].description,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return verticalSpaceMedium;
                },
                itemCount: viewModel.placesList.length,
              ),
            ),
    );
  }

  @override
  ExploreViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExploreViewModel();
}
