import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/view/widgets/cards/card_movie_landscape/card_movie_loading.dart';

class CardListPortraitLoading extends StatefulWidget {
  const CardListPortraitLoading({super.key});

  @override
  State<CardListPortraitLoading> createState() =>
      _CardListPortraitLoadingState();
}

class _CardListPortraitLoadingState extends State<CardListPortraitLoading> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: EdgeInsets.only(left: Constants.spacings.spacing16),
            child: const CardMovieLandscapeLoading());
      },
    );
  }
}
