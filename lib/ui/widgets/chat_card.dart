import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/model/chat_model.dart';

class ChatCard extends StatelessWidget {
  final ChatModel chat;
  final Color textColor;
  final Color cardColor;
  final Color textColorTwo;
  const ChatCard({
    super.key,
    required this.chat,
    required this.textColor,
    required this.cardColor,
    required this.textColorTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: CachedNetworkImageProvider(chat.image),
        ),
        horizontalSpaceSmall,
        horizontalSpaceTiny,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: chat.name,
                        style: manropeBold.copyWith(
                          color: textColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  ManropeText.light(
                      DateFormat("hh:mm a").format(chat.lastMessage.date),
                      12,
                      textColor),
                ],
              ),
              verticalSpaceTiny,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: chat.lastMessage.message,
                        style: manropeMedium.copyWith(
                          color: textColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpaceSmall,
                  Container(
                    constraints: const BoxConstraints(minWidth: 20),
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ManropeText.medium(
                      "2",
                      10,
                      textColorTwo,
                      letterSpacing: 1.2,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
