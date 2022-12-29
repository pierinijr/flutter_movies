import 'package:flutter/material.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view/widgets/labels/label_h4.dart';
import 'package:flutter_movies/view/widgets/labels/label_h5.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_landscape/card_list.dart';
import 'package:flutter_movies/view_model/now_playing_view_model.dart';
import 'package:provider/provider.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  @override
  Widget build(BuildContext context) {
    NowPlayingViewModel movieViewModel = context.watch<NowPlayingViewModel>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelH5(
                label: AppLocalizations.of(context)!.welcome,
                color: AppColors.labelSecondaryColor,
                fontWeightType: FontWeight.w900,
              ),
              LabelH4(label: AppLocalizations.of(context)!.findNewMovie),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            primary: false,
            children: [
              CardListLandscape(
                response: movieViewModel.response,
                title: AppLocalizations.of(context)!.nowPlayingMovies,
                moreButton: true,),
            ],
          )),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.secondaryColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_outlined,
                  color: AppColors.tertiaryColor),
              onPressed: () {},
            ),
            const SizedBox(width: 48.0),
            IconButton(
              icon: const Icon(Icons.favorite_outline,
                  color: AppColors.tertiaryColor),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.tertiaryColor,
        child: const Icon(Icons.search),
        onPressed: () {},
      ),
    );
  }
}
