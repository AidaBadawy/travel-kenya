import 'package:flutter/material.dart';
import 'package:travel_kenya/app/app_export.dart';
import 'package:travel_kenya/model/chat_grid_model.dart';

class ChatGrid extends StatelessWidget {
  final List<ChatGridModel> list;
  final Function onTap;
  final Color bgColor;
  final Color textColor;
  final Color iconColor;
  const ChatGrid(
      {super.key,
      required this.list,
      required this.onTap,
      required this.bgColor,
      required this.textColor,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of items per row
          crossAxisSpacing: 5,
          childAspectRatio: 1.6,
          mainAxisSpacing: 5),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 375),
          columnCount: 3,
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: InkWell(
                onTap: () => onTap(list[index].title),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: index == 0
                          ? const Radius.circular(8)
                          : const Radius.circular(0),
                      topRight: index == 2
                          ? const Radius.circular(8)
                          : const Radius.circular(0),
                    ),
                    color: bgColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        list[index].image,
                        color: iconColor,
                        height: 20,
                      ),
                      verticalSpaceTiny,
                      ManropeText.bold(list[index].title, 12, textColor)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
