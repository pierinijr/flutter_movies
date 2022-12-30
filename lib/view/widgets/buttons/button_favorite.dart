import 'package:flutter/material.dart';
import 'package:flutter_movies/core/utils.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view_model/favorites_view_model.dart';
import 'package:flutter_movies/view_model/now_playing_view_model.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

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
