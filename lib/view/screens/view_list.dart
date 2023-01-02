import 'package:flutter/material.dart';
import 'package:flutter_movies/model/list_arguments_model.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view/widgets/labels/label_h2.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_portrait/card_list.dart';
import 'package:flutter_movies/view_model/lists_view_model.dart';
import 'package:provider/provider.dart';

class ViewList extends StatefulWidget {
  const ViewList({super.key, required this.listDetail});

  final ListArgumentsModel listDetail;

  @override
  State<ViewList> createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {
  @override
  Widget build(BuildContext context) {
    ListsViewModel movieViewModel = context.watch<ListsViewModel>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back, color: AppColors.labelPrimaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: LabelH2(
            label: widget.listDetail.title, fontWeightType: FontWeight.bold),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CardListPortrait(
          listType: widget.listDetail.listType,
          response: movieViewModel.response
          ),
      )
    );
  }
}
