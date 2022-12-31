import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/services/api_response.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_landscape/card_list_completed.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_error.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_landscape/card_list_loading.dart';

class CardListLandscape extends StatefulWidget {
  const CardListLandscape({
    super.key,
    required this.response,
    required this.moreButton,
  });

  final ApiResponse<dynamic> response;
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
        return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: widget.response.data.response.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: Constants.spacings.spacing16),
                      child: CardListLandscapeCompleted(
                        data: widget.response.data.response[index],
                        moreButton: widget.moreButton)
                    );
                  },
                );

      case Status.error:
        String error = widget.response.message ?? "-";
        return CardListError(error: error);
      default:
        return const CardListError();
    }
  }
}
