import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletons/skeletons.dart';
import 'package:travel_kenya/model/category_model.dart';
import 'package:travel_kenya/ui/common/app_colors.dart';
import 'package:travel_kenya/ui/common/app_images.dart';
import 'package:travel_kenya/ui/common/box_text.dart';
import 'package:travel_kenya/ui/common/styles.dart';
import 'package:travel_kenya/ui/common/ui_helpers.dart';
import 'package:travel_kenya/ui/widgets/skeleton_widget.dart';

class ExploreCardOne extends StatelessWidget {
  final Color titleColor;
  final Size size;
  final CategoryModel explore;

  const ExploreCardOne(
      {super.key,
      required this.titleColor,
      required this.size,
      required this.explore});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 140,
          width: 110,
          child: CachedNetworkImage(
            imageUrl: explore.images.first,
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
                    text: explore.title,
                    // recognizer: TapGestureRecognizer()
                    //   ..onTap = () {
                    //     viewModel.addApartment();
                    //   },
                    style: manropeSemiBold.copyWith(
                      color: titleColor,
                      fontSize: 16,
                    )),
              ),
              verticalSpaceSmall,
              RichText(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: explore.description,
                  style: manropeRegular.copyWith(
                    color: titleColor,
                    fontSize: 14,
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
  final int index;
  final CategoryModel explore;

  const ExploreCardTwo({
    super.key,
    required this.explore,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        CachedNetworkImage(
          imageUrl: explore.images.first,
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
          bottom: 5,
          left: 5,
          child: RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: explore.title,
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
