import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/model/trip_model.dart';
import 'package:travel_kenya/ui/views/home/home_viewmodel.dart';

class FeaturedCard extends StatelessWidget {
  final TripModel trip;
  final Color cardColor;
  final Color textColor;
  final bool isLast;
  final HomeViewModel viewModel;
  const FeaturedCard({
    super.key,
    required this.trip,
    required this.cardColor,
    required this.textColor,
    required this.isLast,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      margin: EdgeInsets.only(right: isLast ? 10 : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(trip.image),
                  ),
                ),
                // color: Colors.red,
              ),
              Positioned(
                right: 4,
                bottom: 4,
                child: Container(
                  // margin: const EdgeInsets.only(right: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      ManropeText.medium("24", 12, textColor),
                      horizontalSpaceTiny,
                      SvgPicture.asset(
                        icEye,
                        color: textColor,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                // color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // verticalSpaceTiny,
                  RichText(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text:
                          "Top 10 Must-Visit Destinations for Adventure Travel Enthusiasts",
                      style: manropeBlack.copyWith(
                        color: kcBlack,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  RichText(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: "By Jane Garcia",
                      style: manropeRegular.copyWith(
                        color: kcBlack,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  // RichText(
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  //   text: TextSpan(
                  //       text: DateFormat("dd MMM").format(trip.startDate),
                  //       style: manropeRegular.copyWith(
                  //         color: kcBlack,
                  //         fontSize: 13,
                  //       ),
                  //       children: [
                  //         TextSpan(
                  //           text: " - ",
                  //           style: manropeRegular.copyWith(
                  //             color: kcBlack,
                  //             fontSize: 13,
                  //           ),
                  //         ),
                  //         TextSpan(
                  //           text: DateFormat("dd MMM").format(trip.endDate),
                  //           style: manropeRegular.copyWith(
                  //             color: kcBlack,
                  //             fontSize: 13,
                  //           ),
                  //         )
                  //       ]),
                  // ),
                  // verticalSpaceSmall,
                  // RichText(
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  //   text: TextSpan(
                  //     text: trip.description,
                  //     style: manropeRegular.copyWith(
                  //       color: kcBlack,
                  //       fontSize: 13,
                  //     ),
                  //   ),
                  // ),
                  // verticalSpaceSmall,
                  // verticalSpaceTiny,
                  // // if (trip.tripType == TripType.group)
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: 70,
                  //       height: 30,
                  //       child: Stack(
                  //         children: List.generate(
                  //           trip.users.take(3).length,
                  //           (index) => Positioned(
                  //             left: index * 20,
                  //             child: CircleAvatar(
                  //               radius: 15,
                  //               backgroundImage: CachedNetworkImageProvider(
                  //                   trip.users[index].image),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     if (trip.users.length > 3) ...[
                  //       horizontalSpaceSmall,
                  //       RichText(
                  //         maxLines: 1,
                  //         overflow: TextOverflow.ellipsis,
                  //         text: TextSpan(
                  //           text: "+ ${trip.users.length - 3} more",
                  //           style: manropeRegular.copyWith(
                  //             color: kcBlack,
                  //             fontSize: 13,
                  //           ),
                  //         ),
                  //       ),
                  //     ]
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
