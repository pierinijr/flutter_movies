import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/core/utils.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_movies/model/now_playing_model.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view/widgets/box/box_image.dart';
import 'package:flutter_movies/view/widgets/labels/label_h6.dart';
import 'package:flutter_movies/view_model/details_view_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class CardMoviePortrait extends StatefulWidget {
  const CardMoviePortrait({
    super.key,
    required this.movie
  });

  final Results movie;

  @override
  State<CardMoviePortrait> createState() => _CardMoviePortraitState();
}

class _CardMoviePortraitState extends State<CardMoviePortrait> {
  @override
  Widget build(BuildContext context) {
    String date = widget.movie.releaseDate ?? "";
    String releaseDate = date.isEmpty ? "" : AppLocalizations.of(context)!.release + date;

    double rating = widget.movie.voteAverage != null 
      ? widget.movie.voteAverage! * 0.5
      : 0;
    
    return GestureDetector(
      onTap: () {
        Provider.of<DetailsViewModel>(context, listen: false).fetchDetailsMovieData(widget.movie.id);
        Utils.goView(context, "/detail", arguments: widget.movie.id);
      },
      child: SizedBox(
        width: 150,
        height: 250,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              BoxImage(
                image: widget.movie.posterPath,
                width: 150,
                height: 190,
              ),
              LabelH6(label: widget.movie.title ?? ""),
              LabelH6(
                  label: releaseDate, color: AppColors.labelSecondaryColor),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Constants.spacings.spacing2),
                child: Row(
                  children: [
                    LabelH6(
                      label: widget.movie.voteAverage.toString(),
                      color: AppColors.ratingBar,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Constants.spacings.spacing8),
                      child: RatingBarIndicator(
                        rating: rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: AppColors.ratingBar,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        unratedColor: AppColors.labelSecondaryColor,
                        direction: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
