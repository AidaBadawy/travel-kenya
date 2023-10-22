import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:travel_kenya/app/app_export.dart';

import 'activity_viewmodel.dart';

class ActivityView extends StackedView<ActivityViewModel> {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ActivityViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: theme.colorScheme.onBackground),
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          title: ManropeText.medium(
              "Activity", 18, theme.colorScheme.onBackground),
          centerTitle: true,
          bottom: TabBar(
            labelColor: theme.colorScheme.onBackground,
            labelStyle: manropeMedium.copyWith(
              fontSize: 16,
            ),
            tabs: const [
              Tab(
                text: "Notification",
              ),
              Tab(
                text: "Messages",
              ),
            ],
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () => viewModel.setMasonry(),
          //     icon: SvgPicture.asset(
          //       icDashboard,
          //       color: theme.colorScheme.onBackground,
          //     ),
          //   ),
          // ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: TabBarView(
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  @override
  ActivityViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ActivityViewModel();
}
