import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/services/api_response.dart';
import 'package:flutter_movies/view/widgets/cards/card_movie_landscape/card_movie.dart';

class CardListPortraitCompleted extends StatefulWidget {
  const CardListPortraitCompleted({super.key, required this.response});

  final ApiResponse<dynamic> response;

  @override
  State<CardListPortraitCompleted> createState() =>
      _CardListPortraitCompletedState();
}

class _CardListPortraitCompletedState extends State<CardListPortraitCompleted> {
  @override
  Widget build(BuildContext context) {
    ApiResponse<dynamic> response = widget.response;
    dynamic data = response.data != null ? (response.data.response ?? []) : [];
    List<dynamic> movieList = data.results ?? [];

    return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {
              // TODO: Adicionar paginação
            }
          }
          return true;
        },
        child: ListView.builder(
          primary: false,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(left: Constants.spacings.spacing16),
              child: CardMovieLandscape(movie: movieList[index]),
            );
          },
        ));
  }
}
