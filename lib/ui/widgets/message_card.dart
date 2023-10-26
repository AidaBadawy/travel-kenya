import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/model/message_model.dart';
import 'package:travel_kenya/ui/views/message/message_viewmodel.dart';

class MessageCard extends StatelessWidget {
  final MessageModel message;
  final MessageViewModel viewModel;
  final int index;
  const MessageCard(
      {super.key,
      required this.message,
      required this.viewModel,
      required this.index});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    bool isUser = message.sender.id == viewModel.myUserId;
    bool isPreviousSame = index - 1 >= 0 &&
        index != viewModel.messageList.length - 1 &&
        viewModel.messageList[index + 1].sender.id ==
            viewModel.messageList[index].sender.id;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: isUser
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              constraints: BoxConstraints(
                maxWidth: size.width * 0.7,
                minWidth: size.width * 0.01,
              ),
              child: RichText(
                text: TextSpan(
                  text: "${message.message}${{
                    viewModel.messageList.length
                  }} -- $index",
                  style: manropeMedium.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 13,
                  ),
                ),
              ),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor:
                      !isPreviousSame ? null : theme.colorScheme.background,
                  backgroundImage: !isPreviousSame
                      ? CachedNetworkImageProvider(message.sender.image)
                      : null,
                ),
                horizontalSpaceSmall,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!isPreviousSame) ...[
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: message.sender.name,
                          style: manropeBold.copyWith(
                            color: theme.colorScheme.onBackground,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      verticalSpaceTiny,
                    ],
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      constraints: BoxConstraints(
                        maxWidth: size.width * 0.7,
                        minWidth: size.width * 0.01,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text:
                              "${message.message.trim()}{${viewModel.messageList.length}} -- $index",
                          style: manropeMedium.copyWith(
                            color: theme.colorScheme.onBackground,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
