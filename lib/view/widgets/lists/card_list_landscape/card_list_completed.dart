import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/core/utils.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_movies/model/list_arguments_model.dart';
import 'package:flutter_movies/services/api_response.dart';
import 'package:flutter_movies/view/widgets/buttons/button_text.dart';
import 'package:flutter_movies/view/widgets/cards/card_movie_portrait/card_movie.dart';
import 'package:flutter_movies/view/widgets/labels/label_h3.dart';
import 'package:flutter_movies/view/widgets/labels/label_h4.dart';

class CardListLandscapeCompleted extends StatefulWidget {
  const CardListLandscapeCompleted(
      {super.key,
      required this.response,
      required this.title,
      required this.moreButton});

  final ApiResponse<dynamic> response;
  final String title;
  final bool moreButton;

  @override
  State<CardListLandscapeCompleted> createState() =>
      _CardListLandscapeCompletedState();
}

class _CardListLandscapeCompletedState
    extends State<CardListLandscapeCompleted> {
  @override
  Widget build(BuildContext context) {
    ApiResponse<dynamic> response = widget.response;
    dynamic data = response.data != null ? (response.data.response ?? []) : [];
    List<dynamic> movieList = data.results ?? [];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Constants.spacings.spacing16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabelH3(
                label: widget.title,
                fontWeightType: FontWeight.bold,
              ),
              if (widget.moreButton &&
                  widget.response.data.response.totalResults > 20)
                ButtonText(
                    label: AppLocalizations.of(context)!.more,
                    action: () {
                      Utils.goView(context, "/list",
                          arguments: ListArgumentsModel(
                              title: widget.title, type: data.runtimeType));
                    }),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: movieList.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelH4(
                        label: AppLocalizations.of(context)!.emptyList,
                        maxLines: 2,
                        textAlign: TextAlign.center),
                  ],
                )
              : ListView.builder(
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: movieList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: Constants.spacings.spacing16),
                      child: CardMoviePortrait(movie: movieList[index]),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
