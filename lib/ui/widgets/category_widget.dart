import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_kenya/model/category_model.dart';
import 'package:travel_kenya/ui/common/app_colors.dart';
import 'package:travel_kenya/ui/common/box_text.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel place;
  const CategoryWidget({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      // height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(place.images.first),
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent, // You can set your desired color here
              Colors.brown.withOpacity(0.8), // Adjust the opacity as needed
            ],
          ),
        ),
        child: ManropeText.medium(place.title, 14, kcWhite),
      ),
    );
  }
}
