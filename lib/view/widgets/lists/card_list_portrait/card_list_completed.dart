import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_movies/model/lists_model.dart';
import 'package:flutter_movies/services/api_response.dart';
import 'package:flutter_movies/view/widgets/cards/card_movie_landscape/card_movie.dart';
import 'package:flutter_movies/view_model/lists_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';

class CardListPortraitCompleted extends StatefulWidget {
  const CardListPortraitCompleted({
    super.key, 
    required this.response,
    required this.listType});

  final ApiResponse<dynamic> response;
  final String listType;

  @override
  State<CardListPortraitCompleted> createState() =>
      _CardListPortraitCompletedState();
}

class _CardListPortraitCompletedState extends State<CardListPortraitCompleted> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void fetchMovie() {
    Provider.of<ListsViewModel>(context, listen: false)
        .fetchListsData(listType: widget.listType);
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    fetchMovie();
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse<dynamic> response = widget.response;
    dynamic data = response.data != null ? (response.data.response ?? []) : [];
    ListsModel dataList = data.firstWhere((a) => a.type == widget.listType);
    List<dynamic> movieList = dataList.results ?? [];

    return SmartRefresher(
      controller: _refreshController,
      onLoading: _onLoading,
      enablePullDown: false,
      enablePullUp: true,
      footer: ClassicFooter(
        loadStyle: LoadStyle.HideAlways,
        loadingText: AppLocalizations.of(context)!.loading,
        canLoadingText: AppLocalizations.of(context)!.pullUp,
        idleText: AppLocalizations.of(context)!.pullUp,
      ),
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
      ),
    );
  }
}
