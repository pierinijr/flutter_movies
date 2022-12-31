import 'package:flutter/material.dart';
import 'package:flutter_movies/services/api_response.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_error.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_portrait/card_list_completed.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_portrait/card_list_loading.dart';

class CardListPortrait extends StatefulWidget {
  const CardListPortrait({
    super.key,
    required this.response,
    required this.listType
  });

  final ApiResponse<dynamic> response;
  final String listType;

  @override
  State<CardListPortrait> createState() => _CardListPortraitState();
}

class _CardListPortraitState extends State<CardListPortrait> {
  @override
  Widget build(BuildContext context) {
    switch (widget.response.status) {
      case Status.loading:
        return const CardListPortraitLoading();
      case Status.completed:
        return CardListPortraitCompleted(
          listType: widget.listType,
          response: widget.response);
      case Status.error:
        String error = widget.response.message ?? "-";
        return CardListError(error: error);
      default:
        return const CardListError();
    }
  }
}