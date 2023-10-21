import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:travel_kenya/ui/widgets/app_drawer.dart';

import 'explore_viewmodel.dart';

class ExploreView extends StackedView<ExploreViewModel> {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ExploreViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ExploreViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExploreViewModel();
}
