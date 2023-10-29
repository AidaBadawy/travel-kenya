import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/model/trip_model.dart';

class TripCardOne extends StatelessWidget {
  final Color titleColor;
  final Color dateColor;
  final Color dateCardColor;
  final Size size;
  final TripModel trip;
  const TripCardOne({
    super.key,
    required this.titleColor,
    required this.dateColor,
    required this.dateCardColor,
    required this.size,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: dateCardColor,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                ManropeText.semiBold(
                    DateFormat("dd").format(trip.startDate), 13, dateColor),
                ManropeText.medium(
                  DateFormat("MMM").format(trip.startDate).toUpperCase(),
                  12,
                  dateColor,
                ),
              ],
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 140,
              width: 110,
              child: CachedNetworkImage(
                imageUrl: trip.image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const SkeletonAvatar(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            horizontalSpaceSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        text: trip.title,
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () {
                        //     viewModel.addApartment();
                        //   },
                        style: manropeSemiBold.copyWith(
                          color: titleColor,
                          fontSize: 16,
                          // decoration: TextDecoration.underline,
                        )),
                  ),
                  verticalSpaceSmall,
                  RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: trip.description,
                      style: manropeRegular.copyWith(
                        color: titleColor,
                        fontSize: 14,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                        height: 30,
                        child: Stack(
                          children: List.generate(
                            trip.users.take(3).length,
                            (index) => Positioned(
                              left: index * 20,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage: CachedNetworkImageProvider(
                                    trip.users[index].image),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (trip.users.length > 3) ...[
                        horizontalSpaceSmall,
                        RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: "+ ${trip.users.length - 3} more",
                            style: manropeRegular.copyWith(
                              color: kcBlack,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                  verticalSpaceTiny,
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width / 3,
                          child: Divider(
                            thickness: 1,
                            color: titleColor,
                          ),
                        ),
                        horizontalSpaceSmall,
                        ManropeText.light("Trip", 12, titleColor),
                        horizontalSpaceTiny,
                        SvgPicture.asset(
                          icCaretRight,
                          color: titleColor,
                          height: 18,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class TripCardTwo extends StatelessWidget {
  final TripModel trip;
  final Color cardColor;
  final Color textColor;
  final bool isLast;
  const TripCardTwo({
    super.key,
    required this.trip,
    required this.cardColor,
    required this.textColor,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 260,
      margin: EdgeInsets.only(right: isLast ? 10 : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 120,
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
                child: Row(
                  children: List.generate(
                    trip.tags.length,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            setTripIcon(trip.tags[index]),
                            color: textColor,
                            height: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // verticalSpaceTiny,
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: trip.title,
                      style: manropeBlack.copyWith(
                        color: kcBlack,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  verticalSpaceTiny,
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        text: DateFormat("dd MMM").format(trip.startDate),
                        style: manropeRegular.copyWith(
                          color: kcBlack,
                          fontSize: 13,
                        ),
                        children: [
                          TextSpan(
                            text: " - ",
                            style: manropeRegular.copyWith(
                              color: kcBlack,
                              fontSize: 13,
                            ),
                          ),
                          TextSpan(
                            text: DateFormat("dd MMM").format(trip.endDate),
                            style: manropeRegular.copyWith(
                              color: kcBlack,
                              fontSize: 13,
                            ),
                          )
                        ]),
                  ),
                  verticalSpaceSmall,
                  RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: trip.description,
                      style: manropeRegular.copyWith(
                        color: kcBlack,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  verticalSpaceTiny,
                  // if (trip.tripType == TripType.group)
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                        height: 30,
                        child: Stack(
                          children: List.generate(
                            trip.users.take(3).length,
                            (index) => Positioned(
                              left: index * 20,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundImage: CachedNetworkImageProvider(
                                    trip.users[index].image),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (trip.users.length > 3) ...[
                        horizontalSpaceSmall,
                        RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: "+ ${trip.users.length - 3} more",
                            style: manropeRegular.copyWith(
                              color: kcBlack,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ]
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  setTripIcon(String tag) {
    String icon = "";

    switch (tag) {
      case "Beach":
        icon = icBeach;
        break;
      case "Scenery":
        icon = icSunset;
        break;
      case "Adventure":
        icon = icTent;
        break;
      case "Wildlife":
        icon = icWildlife;
        break;
      case "Culture":
        icon = icCulture;
        break;
      default:
    }

    return icon;
  }
}
