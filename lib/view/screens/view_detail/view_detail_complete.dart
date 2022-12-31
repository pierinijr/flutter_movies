import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/core/utils.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_movies/model/details_model.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view/widgets/buttons/button_favorite.dart';
import 'package:flutter_movies/view/widgets/labels/label_h1.dart';
import 'package:flutter_movies/view/widgets/labels/label_h4.dart';
import 'package:flutter_movies/view/widgets/labels/label_h5.dart';
import 'package:flutter_movies/view/widgets/lists/video_list.dart';
import 'package:shimmer/shimmer.dart';

class ViewDetailComplete extends StatefulWidget {
  const ViewDetailComplete({super.key, required this.details});

  final DetailsModel details;

  @override
  State<ViewDetailComplete> createState() => _ViewDetailCompleteState();
}

class _ViewDetailCompleteState extends State<ViewDetailComplete> {
  @override
  Widget build(BuildContext context) {
    String date = widget.details.releaseDate ?? "";
    String releaseDate =
        date.isEmpty ? "" : AppLocalizations.of(context)!.release + date;
    String duration = AppLocalizations.of(context)!.duration +
        Utils.getTimeString(widget.details.runtime ?? 0);
    String votes = "";
    if (widget.details.voteCount != null) {
      votes =
          "(${AppLocalizations.of(context)!.votes}${widget.details.voteCount})";
    }
    String voteAverage = "";
    if (widget.details.voteAverage != null) {
      if (widget.details.voteAverage! > 0.0) {
        voteAverage = widget.details.voteAverage!.toStringAsFixed(2);
      }
    }                                 
    String movieCover = Constants.endpoints.movieBackdrop 
      + (widget.details.backdropPath ?? widget.details.posterPath ?? "");

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: AppColors.primaryColor,
              expandedHeight: MediaQuery.of(context).size.width,
              pinned: true,
              bottom: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
                child: const SizedBox(),
              ),
              flexibleSpace: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Image.network(
                    movieCover,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object obj,
                        StackTrace? stackTrace) {
                      return Image.asset(Constants.images.movieNotFound);
                    },
                    frameBuilder: (BuildContext context, Widget child,
                        int? frame, bool wasSynchronouslyLoaded) {
                      if (frame == null) {
                        return Shimmer.fromColors(
                          baseColor: AppColors.primaryShimmer,
                          highlightColor: AppColors.secondaryShimmer,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryShimmer,
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        );
                      }
                      return child;
                    },
                  ))
                ],
              ),
            ),
          ];
        },
        body: Container(
          color: AppColors.primaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.spacings.spacing16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: Constants.spacings.spacing8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.ratingBar,
                              ),
                              if (voteAverage.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: Constants.spacings.spacing8),
                                  child: LabelH4(
                                      label: voteAverage,
                                      fontWeightType: FontWeight.bold,
                                      color: AppColors.ratingBar),
                                ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Constants.spacings.spacing8),
                                child: LabelH4(
                                    label: votes,
                                    fontWeightType: FontWeight.bold,
                                    color: AppColors.ratingBar),
                              )
                            ],
                          ),
                          Row(
                            children: [ButtonFavorite(id: widget.details.id)],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: Constants.spacings.spacing8),
                      child: LabelH1(
                          label: widget.details.title,
                          fontWeightType: FontWeight.bold,
                          maxLines: 2,
                          height: 1.0),
                    ),
                    LabelH5(
                      label: releaseDate,
                      color: AppColors.labelSecondaryColor,
                      fontWeightType: FontWeight.bold,
                    ),
                    LabelH5(
                      label: duration,
                      color: AppColors.labelSecondaryColor,
                      fontWeightType: FontWeight.bold,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: Constants.spacings.spacing8),
                      child: LabelH4(
                        label: widget.details.overview,
                        maxLines: 1000,
                      ),
                    ),
                    if (widget.details.videos != null)
                      VideoList(videoList: widget.details.videos!.results)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
