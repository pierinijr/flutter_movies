import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view/widgets/cards/card_movie_portrait/card_movie_loading.dart';
import 'package:shimmer/shimmer.dart';

class CardListLandscapeLoading extends StatefulWidget {
  const CardListLandscapeLoading({super.key});

  @override
  State<CardListLandscapeLoading> createState() =>
      _CardListLandscapeLoadingState();
}

class _CardListLandscapeLoadingState extends State<CardListLandscapeLoading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Constants.spacings.spacing16, vertical: 8),
          child: Shimmer.fromColors(
            baseColor: AppColors.primaryShimmer,
            highlightColor: AppColors.secondaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryShimmer,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                Container(
                  width: 75,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryShimmer,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: ListView.builder(
            primary: false,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(left: Constants.spacings.spacing16),
                  child: const CardMoviePortraitLoading());
            },
          ),
        ),
      ],
    );
  }
}
