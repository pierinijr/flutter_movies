import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view/widgets/cards/card_movie_landscape/card_movie.dart';
import 'package:flutter_movies/view/widgets/labels/label_h2.dart';
import 'package:flutter_movies/view/widgets/labels/label_h4.dart';
import 'package:flutter_movies/view/widgets/labels/label_h5.dart';
import 'package:flutter_movies/view_model/favorites_view_model.dart';
import 'package:provider/provider.dart';

class ViewFavorites extends StatefulWidget {
  const ViewFavorites({super.key});

  @override
  State<ViewFavorites> createState() => _ViewFavoritesState();
}

class _ViewFavoritesState extends State<ViewFavorites> {
  @override
  Widget build(BuildContext context) {
    FavoritesViewModel movieViewModel = context.watch<FavoritesViewModel>();
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: AppColors.labelPrimaryColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: LabelH2(
              label: AppLocalizations.of(context)!.favorites,
              fontWeightType: FontWeight.bold),
          centerTitle: true,
        ),
        body: SafeArea(
          child: movieViewModel.favorites.isEmpty
              ? Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Constants.images.logo,
                        width: 100,
                        height: 100,
                      ),
                      LabelH4(
                        label: AppLocalizations.of(context)!.emptyFavorites, 
                        fontWeightType: FontWeight.bold,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        height: 3.0,),
                      LabelH5(
                        label: AppLocalizations.of(context)!.favoritesHere,
                        maxLines: 2,
                        textAlign: TextAlign.center),
                    ],
                  ),
                ),
              )
              : ListView.builder(
                  primary: false,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: movieViewModel.favorites.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: Constants.spacings.spacing16),
                      child: CardMovieLandscape(
                          movie: movieViewModel.favorites[index]),
                    );
                  },
                ),
        ));
  }
}
