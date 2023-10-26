import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:travel_kenya/model/chat_model.dart';
import 'package:travel_kenya/ui/common/box_text.dart';
import 'package:travel_kenya/ui/common/ui_helpers.dart';
import 'package:travel_kenya/ui/widgets/message_card.dart';

import 'message_viewmodel.dart';

class MessageView extends StackedView<MessageViewModel> {
  final ChatModel chat;
  const MessageView({Key? key, required this.chat}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MessageViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        iconTheme: IconThemeData(color: theme.colorScheme.onBackground),
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(chat.image),
            ),
            horizontalSpaceSmall,
            Expanded(
              child: ManropeText.semiBold(
                  chat.name, 14, theme.colorScheme.onBackground),
            ),
          ],
        ),
        centerTitle: false,
        // actions: [
        //   IconButton(
        //     onPressed: () => viewModel.navigateToActivityPage(),
        //     icon: SvgPicture.asset(
        //       icMessagePlus,
        //       color: theme.colorScheme.onBackground,
        //     ),
        //   ),
        // ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              itemBuilder: (context, index) {
                return MessageCard(
                  message: viewModel.messageList[index],
                  viewModel: viewModel,
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return verticalSpaceSmall;
              },
              itemCount: viewModel.messageList.length,
            ),
          )
        ],
      ),
    );
  }

  @override
  MessageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MessageViewModel();

  @override
  void onViewModelReady(MessageViewModel viewModel) {
    viewModel.initMessageView();
    super.onViewModelReady(viewModel);
  }
}
