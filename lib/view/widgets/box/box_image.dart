import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:shimmer/shimmer.dart';

class BoxImage extends StatefulWidget {
  const BoxImage({
    super.key, 
    required this.width,
    required this.height,
    this.image});

  final String? image;
  final double width;
  final double height;

  @override
  State<BoxImage> createState() => _BoxImageState();
}

class _BoxImageState extends State<BoxImage> {
  @override
  Widget build(BuildContext context) {
    if (widget.image != null) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            position: DecorationPosition.foreground,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: AdvancedNetworkImage(
                  Constants.endpoints.moviePoster + widget.image!,
                ),
                fit: BoxFit.fill,
                errorBuilder:
                    (BuildContext context, Object obj, StackTrace? stackTrace) {
                  return Image.asset(Constants.images.movieNotFound);
                },
                frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool wasSynchronouslyLoaded) {
                  if (frame == null) {
                    return Shimmer.fromColors(
                      baseColor: AppColors.primaryShimmer,
                      highlightColor: AppColors.secondaryShimmer,
                      child: Container(
                        width: widget.width,
                        height: widget.height,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryShimmer,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    );
                  }
                  return child;
                },
              ),
            )),
      );
    }
    return SizedBox(
        width: 150,
        height: 190,
        child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            position: DecorationPosition.foreground,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(Constants.images.movieNotFound, fit: BoxFit.fill),
            )),
      );
  }
}
