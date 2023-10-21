import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'activity_viewmodel.dart';

class ActivityView extends StackedView<ActivityViewModel> {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ActivityViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ActivityViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ActivityViewModel();
}
