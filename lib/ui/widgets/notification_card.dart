import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/model/notification_model.dart';
import 'package:travel_kenya/ui/common/enums.dart';
import 'package:travel_kenya/ui/widgets/button_widget.dart';

class NotificationCard extends StatelessWidget {
  final Color textColor;
  final Color cardColor;
  final Color textColorTwo;
  final NotificationModel notification;
  const NotificationCard({
    super.key,
    required this.textColor,
    required this.cardColor,
    required this.textColorTwo,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    String detail = "";

    switch (notification.notificationType) {
      case NotificationType.comment:
        detail = "Added a cooment in";
        break;
      case NotificationType.mention:
        detail = "Mentioned you in";
        break;
      case NotificationType.request:
        detail = "Invited you in";
        break;
      default:
    }
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(notification.image),
            ),
            horizontalSpaceSmall,
            horizontalSpaceTiny,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        text: notification.title,
                        style: manropeBold.copyWith(
                          color: textColor,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: ' $detail',
                            style: manropeRegular.copyWith(
                              color: textColor,
                              fontSize: 14,
                            ),
                          ),
                        ]),
                  ),
                  verticalSpaceTiny,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: notification.description,
                          style: manropeBold.copyWith(
                            color: cardColor,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      horizontalSpaceSmall,
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: kcLightGrey,
                        ),
                      ),
                      horizontalSpaceSmall,
                      ManropeText.regular(
                          DateFormat("hh:mm a").format(notification.date),
                          12,
                          textColor)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: cardColor,
              ),
            )
          ],
        ),
        if (notification.notificationType == NotificationType.request) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                onPressed: () {},
                isBusy: false,
                text: "Reject",
                btnColor: cardColor,
                textColor: cardColor,
                radius: 25,
                height: 40,
                fontSize: 14,
                hasIcon: false,
                isOutline: true,
              ),
              horizontalSpaceSmall,
              ButtonWidget(
                onPressed: () {},
                isBusy: false,
                text: "Accept",
                btnColor: cardColor,
                textColor: textColorTwo,
                radius: 25,
                height: 40,
                fontSize: 14,
                hasIcon: false,
              )
            ],
          )
        ]
      ],
    );
  }
}
