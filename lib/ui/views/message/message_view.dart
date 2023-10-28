import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/model/chat_model.dart';
import 'package:travel_kenya/ui/views/message/message_view.form.dart';
import 'package:travel_kenya/ui/widgets/chat_grid.dart';
import 'package:travel_kenya/ui/widgets/message_card.dart';
import 'message_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'message',
  ),
])
class MessageView extends StackedView<MessageViewModel> with $MessageView {
  final ChatModel chat;
  const MessageView({Key? key, required this.chat}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MessageViewModel viewModel,
    Widget? child,
  ) {
    var theme = Theme.of(context);

    viewModel.setKeyboardOpen(MediaQuery.of(context).viewInsets.bottom != 0);
    Size size = MediaQuery.of(context).size;
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
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.separated(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: messageController,
                        focusNode: messageFocusNode,
                        style: manropeMedium.copyWith(fontSize: 14),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          hintText: "Message...",
                          hintStyle: manropeMedium.copyWith(fontSize: 14),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                messageFocusNode.unfocus();
                                viewModel.setPlusTapped();
                              },
                              child: Transform.rotate(
                                angle: viewModel.isPlusTapped ? 14.9 : 0,
                                child: SvgPicture.asset(
                                  icPlus,
                                  color: theme.colorScheme.primary,
                                  height: 10,
                                ),
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                BorderSide(color: theme.colorScheme.primary),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                BorderSide(color: theme.colorScheme.primary),
                          ),
                        ),
                        maxLines: viewModel.isMaxLineExceeded ? 4 : null,
                        onChanged: (value) {
                          viewModel.setIsMessageTyping(value);
                        },
                      ),
                    ),
                    horizontalSpaceTiny,
                    Container(
                      height: 50,
                      // width: 60,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: theme.colorScheme.primary,
                        border: Border.all(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      child: SvgPicture.asset(
                        viewModel.isTyping ? icSend : icRecord,
                        color: kcWhite,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          if (viewModel.isPlusTapped)
            Positioned(
              bottom: 60,
              left: 20,
              child: Container(
                width: size.width - 95,
                decoration: BoxDecoration(
                  color: kcWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      offset: const Offset(0, 0), // Offset (x, y) from the top
                      blurRadius: 2.0, // Spread of the shadow
                      spreadRadius: 1.0, // Extends the shadow size
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ChatGrid(
                  list: viewModel.gridList,
                  onTap: (value) {
                    print(value);
                  },
                  bgColor: theme.colorScheme.primary,
                  textColor: kcWhite,
                  iconColor: kcWhite,
                ),
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
