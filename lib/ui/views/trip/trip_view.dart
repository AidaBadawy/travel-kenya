import 'package:flutter/material.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/ui/common/enums.dart';
import 'package:travel_kenya/ui/widgets/trip_card.dart';

import 'trip_viewmodel.dart';

class TripView extends StackedView<TripViewModel> {
  const TripView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TripViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const AppDrawer(),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onBackground),
        backgroundColor: Theme.of(context).colorScheme.background,
        title: ManropeText.medium("Trips", 18, theme.colorScheme.onBackground),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    viewModel.setTripType(TripType.personal);
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: viewModel.tripType == TripType.personal
                          ? theme.colorScheme.primary
                          : theme.colorScheme.background,
                      border: Border.all(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    child: ManropeText.medium(
                        viewModel.tabList.first,
                        16,
                        viewModel.tripType != TripType.personal
                            ? theme.colorScheme.primary
                            : theme.colorScheme.background),
                  ),
                ),
              ),
              horizontalSpaceSmall,
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    viewModel.setTripType(TripType.group);
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: viewModel.tripType == TripType.group
                          ? theme.colorScheme.primary
                          : theme.colorScheme.background,
                      border: Border.all(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    child: ManropeText.medium(
                        viewModel.tabList.last,
                        16,
                        viewModel.tripType != TripType.group
                            ? theme.colorScheme.primary
                            : theme.colorScheme.background),
                  ),
                ),
              ),
            ]),
          ),
          verticalSpaceSmall,
          Expanded(
            child: AnimationLimiter(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 605),
                    child: SlideAnimation(
                      horizontalOffset: MediaQuery.of(context).size.width / 2,
                      child: FadeInAnimation(
                        child: TripCardTwo(
                          trip: viewModel.tripListData[index],
                          cardColor: theme.colorScheme.primary,
                          isLast: index == viewModel.tripListData.length - 1,
                          textColor: theme.colorScheme.background,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return verticalSpaceMedium;
                },
                itemCount: viewModel.tripListData.length,
              ),
            ),
          ),
          // ListView.separated(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     shrinkWrap: true,
          //     physics: const BouncingScrollPhysics(),
          //     scrollDirection: Axis.vertical,
          //     itemCount: viewModel.tripListData.length,
          //     separatorBuilder: (context, index) {
          //       return verticalSpaceSmall;
          //     },
          //     itemBuilder: (context, index) {
          //       return TripCardOne(
          //         trip: viewModel.tripListData[index],
          //         titleColor: theme.colorScheme.onBackground,
          //         size: size,
          //         dateCardColor: theme.colorScheme.secondary,
          //         dateColor: theme.colorScheme.onInverseSurface,
          //       );
          //     }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.navigateToAddTrip(),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  TripViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TripViewModel();

  @override
  void onViewModelReady(TripViewModel viewModel) {
    viewModel.initTrip();
    super.onViewModelReady(viewModel);
  }
}
