import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/core/utils.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_movies/model/now_playing_model.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view/widgets/box/box_image.dart';
import 'package:flutter_movies/view/widgets/labels/label_h4.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardMovieLandscape extends StatefulWidget {
  const CardMovieLandscape({
    super.key,
    required this.movie
  });

  final Results movie;

  @override
  State<CardMovieLandscape> createState() => _CardMovieLandscapeState();
}

class _CardMovieLandscapeState extends State<CardMovieLandscape> {
  @override
  Widget build(BuildContext context) {
    String release = "${AppLocalizations.of(context)!.release}: ";
    String date = widget.movie.releaseDate ?? "";
    String releaseDate = date.isEmpty ? "" : release + date;

    double rating = widget.movie.voteAverage != null
      ? widget.movie.voteAverage! * 0.5
      : 0;

    return GestureDetector(
      onTap: () {
        Utils.goView(context, "/detail", arguments: widget.movie.id);
      },
      child: SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              BoxImage(
                image: widget.movie.posterPath,
                width: 100,
                height: 134,
              ),
              Padding(
                padding: EdgeInsets.only(left: Constants.spacings.spacing16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelH4(label: widget.movie.title ?? "", maxLines: 2,),
                      LabelH4(label: releaseDate, color: AppColors.labelSecondaryColor),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Constants.spacings.spacing2),
                        child: RatingBarIndicator(
                          rating: rating,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: AppColors.ratingBar,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
