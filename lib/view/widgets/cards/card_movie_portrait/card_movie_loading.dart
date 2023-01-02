import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:shimmer/shimmer.dart';

class CardMoviePortraitLoading extends StatefulWidget {
  const CardMoviePortraitLoading({
    super.key,
  });

  @override
  State<CardMoviePortraitLoading> createState() =>
      _CardMoviePortraitLoadingState();
}

class _CardMoviePortraitLoadingState extends State<CardMoviePortraitLoading> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 250,
      child: Shimmer.fromColors(
        baseColor: AppColors.primaryShimmer,
        highlightColor: AppColors.secondaryColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 150,
                height: 190,
                decoration: const BoxDecoration(
                  color: AppColors.primaryShimmer,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Constants.spacings.spacing8),
                child: Container(
                  height: 8,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryShimmer,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Constants.spacings.spacing8),
                child: Container(
                  height: 8,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryShimmer,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Constants.spacings.spacing8),
                child: Container(
                  height: 8,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryShimmer,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
