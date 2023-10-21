import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:travel_kenya/ui/widgets/app_drawer.dart';

import 'events_viewmodel.dart';

class EventsView extends StackedView<EventsViewModel> {
  const EventsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EventsViewModel viewModel,
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
  EventsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EventsViewModel();
}
