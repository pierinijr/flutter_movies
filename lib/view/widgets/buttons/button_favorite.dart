import 'package:flutter/material.dart';
import 'package:flutter_movies/core/utils.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:like_button/like_button.dart';

class ButtonFavorite extends StatefulWidget {
  const ButtonFavorite({
    super.key, 
    required this.id});

  final int? id;

  @override
  State<ButtonFavorite> createState() => _ButtonFavoriteState();
}

class _ButtonFavoriteState extends State<ButtonFavorite> {
  @override
  Widget build(BuildContext context) {
    return LikeButton(
        isLiked: Utils.isFavorite(context, widget.id),
        onTap: (isLiked) async {
          Utils.changeFavorite(context, widget.id, isLiked);
          return !isLiked;
        },
        circleColor:
            const CircleColor(start: AppColors.ratingBar, end: AppColors.tertiaryColor),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: AppColors.ratingBar,
          dotSecondaryColor: AppColors.tertiaryColor,
        ),
        likeBuilder: (bool isLiked) {
          return Icon(
            Icons.favorite,
            color: isLiked ? AppColors.primaryFavorite : AppColors.secondaryFavorite,
          );
        });
  }
}
