import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletons/skeletons.dart';
import 'package:travel_kenya/ui/common/app_images.dart';
import 'package:travel_kenya/ui/common/box_text.dart';
import 'package:travel_kenya/ui/common/styles.dart';
import 'package:travel_kenya/ui/common/ui_helpers.dart';
import 'package:travel_kenya/ui/widgets/skeleton_widget.dart';

class ExploreCardOne extends StatelessWidget {
  final Color titleColor;
  final Size size;
  final String title;
  final String description;
  final String image;
  const ExploreCardOne(
      {super.key,
      required this.titleColor,
      required this.size,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 140,
          width: 110,
          child: CachedNetworkImage(
            imageUrl: image,
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
                    text: title,
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
                  text: description,
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
                    ManropeText.light("Explore", 12, titleColor),
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
    );
  }
}

class ExploreCardTwo extends StatelessWidget {
  final String image;
  final int index;
  const ExploreCardTwo({super.key, required this.image, required this.index});

  @override
  Widget build(BuildContext context) {
    // return CachedNetworkImage(
    //   imageUrl: image,
    //   imageBuilder: (context, imageProvider) => Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(8),
    //       image: DecorationImage(
    //         image: imageProvider,
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //   ),
    //   placeholder: (context, url) => const SkeletonAvatar(),
    //   errorWidget: (context, url, error) => const Icon(Icons.error),
    // );
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => SkeletonExplore(
        index: index,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
