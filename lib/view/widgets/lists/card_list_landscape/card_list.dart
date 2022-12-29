import 'package:flutter/material.dart';
import 'package:flutter_movies/services/api_response.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_landscape/card_list_completed.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_error.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_landscape/card_list_loading.dart';

class CardListLandscape extends StatefulWidget {
  const CardListLandscape({
    super.key,
    required this.response,
    required this.title,
    required this.moreButton,
  });

  final ApiResponse<dynamic> response;
  final String title;
  final bool moreButton;

  @override
  State<CardListLandscape> createState() => _CardListLandscapeState();
}

class _CardListLandscapeState extends State<CardListLandscape> {
  @override
  Widget build(BuildContext context) {
    switch (widget.response.status) {
      case Status.loading:
        return const CardListLandscapeLoading();
      case Status.completed:
        return CardListLandscapeCompleted(
            response: widget.response,
            title: widget.title,
            moreButton: widget.moreButton);
      case Status.error:
        String error = widget.response.message ?? "-";
        return CardListError(error: error);
      default:
        return const CardListError();
    }
  }
}
