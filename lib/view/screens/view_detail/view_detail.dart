import 'package:flutter/material.dart';
import 'package:flutter_movies/core/utils.dart';
import 'package:flutter_movies/model/details_model.dart';
import 'package:flutter_movies/services/api_response.dart';
import 'package:flutter_movies/view/screens/view_detail/view_detail_complete.dart';
import 'package:flutter_movies/view/screens/view_detail/view_detail_error.dart';
import 'package:flutter_movies/view/screens/view_detail/view_detail_loading.dart';
import 'package:flutter_movies/view_model/details_view_model.dart';
import 'package:provider/provider.dart';

class ViewDetail extends StatefulWidget {
  const ViewDetail({super.key, required this.movieId});

  final int movieId;

  @override
  State<ViewDetail> createState() => _ViewDetailState();
}

class _ViewDetailState extends State<ViewDetail> {
  @override
  Widget build(BuildContext context) {
    DetailsViewModel movieViewModel = context.watch<DetailsViewModel>();
    switch (movieViewModel.response.status) {
      case Status.loading:
        return const ViewDetailLoading();
      case Status.completed:
        DetailsModel details = movieViewModel.response.data.response;
        return ViewDetailComplete(details: details);
      case Status.error:
        String error = movieViewModel.response.message ?? "-";
        Utils.showToast(error);
        return ViewDetailError(error: error);
      default:
        return const ViewDetailError();
    }
  }
}
