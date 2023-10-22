import 'package:flutter/material.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/ui/widgets/chat_card.dart';
import 'package:travel_kenya/ui/widgets/notification_card.dart';

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
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              itemBuilder: (context, index) {
                return NotificationCard(
                  notification: viewModel.notificationList[index],
                  textColor: theme.colorScheme.onBackground,
                  cardColor: theme.colorScheme.primary,
                  textColorTwo: theme.colorScheme.surface,
                );
              },
              separatorBuilder: (context, index) {
                return verticalSpaceMedium;
              },
              itemCount: viewModel.chatList.length,
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              itemBuilder: (context, index) {
                return ChatCard(
                  chat: viewModel.chatList[index],
                  textColor: theme.colorScheme.onBackground,
                  cardColor: theme.colorScheme.primary,
                  textColorTwo: theme.colorScheme.surface,
                );
              },
              separatorBuilder: (context, index) {
                return verticalSpaceMedium;
              },
              itemCount: viewModel.chatList.length,
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
