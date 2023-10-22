import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/ui/widgets/skeleton_widget.dart';

class EventsCardOne extends StatelessWidget {
  final Color titleColor;
  final Color dateColor;
  final Color dateCardColor;
  final Size size;
  final CategoryModel event;
  const EventsCardOne({
    super.key,
    required this.titleColor,
    required this.dateColor,
    required this.dateCardColor,
    required this.size,
    required this.event,
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
                    DateFormat("dd").format(event.date!), 13, dateColor),
                ManropeText.medium(
                  DateFormat("MMM").format(event.date!).toUpperCase(),
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
                imageUrl: event.images.first,
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
                        text: event.title,
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
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: event.description,
                      style: manropeRegular.copyWith(
                        color: titleColor,
                        fontSize: 14,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
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
                        ManropeText.light("Event", 12, titleColor),
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

class EventsCardTwo extends StatelessWidget {
  final int index;
  final CategoryModel event;
  final Color dateColor;
  final Color dateCardColor;

  const EventsCardTwo(
      {super.key,
      required this.index,
      required this.event,
      required this.dateColor,
      required this.dateCardColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        CachedNetworkImage(
          imageUrl: event.images.first,
          placeholder: (context, url) => SkeletonExplore(
            index: index,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Positioned.fill(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.brown,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.brown
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0, 0.6, 1],
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            decoration: BoxDecoration(
              color: dateCardColor,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                ManropeText.semiBold(
                    DateFormat("dd").format(event.date!), 13, dateColor),
                ManropeText.medium(
                  DateFormat("MMM").format(event.date!).toUpperCase(),
                  12,
                  dateColor,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: event.title,
              style: manropeSemiBold.copyWith(
                color: kcWhite,
                fontSize: 14,
                // decoration: TextDecoration.underline,
              ),
            ),
          ),
        )
      ],
    );
  }
}
