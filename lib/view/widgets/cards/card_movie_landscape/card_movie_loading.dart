import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:shimmer/shimmer.dart';

class CardMovieLandscapeLoading extends StatefulWidget {
  const CardMovieLandscapeLoading({
    super.key,
  });

  @override
  State<CardMovieLandscapeLoading> createState() =>
      _CardMovieLandscapeLoadingState();
}

class _CardMovieLandscapeLoadingState extends State<CardMovieLandscapeLoading> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Shimmer.fromColors(
        baseColor: AppColors.primaryShimmer,
        highlightColor: AppColors.secondaryColor,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 100,
                height: 134,
                decoration: const BoxDecoration(
                  color: AppColors.primaryShimmer,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Padding(
              padding: EdgeInsets.only(left: Constants.spacings.spacing16),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryShimmer,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Constants.spacings.spacing8),
                      child: Container(
                        width: 100,
                        height: 18,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryShimmer,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryShimmer,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),                    
                  ],
                ),
              ),
            )
            ]),
      ),
    );
  }
}
