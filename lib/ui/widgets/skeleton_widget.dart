import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonExplore extends StatelessWidget {
  final int index;
  const SkeletonExplore({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
      child: SkeletonAvatar(
        style: SkeletonAvatarStyle(
          height: index % 2 == 0 ? 250 : 120,
        ),
      ),
    );
  }
}
