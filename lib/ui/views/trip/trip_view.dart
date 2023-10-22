import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:travel_kenya/ui/widgets/app_drawer.dart';

import 'trip_viewmodel.dart';

class TripView extends StackedView<TripViewModel> {
  const TripView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TripViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  TripViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TripViewModel();
}
