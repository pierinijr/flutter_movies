import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view/widgets/buttons/button_text.dart';
import 'package:flutter_movies/view/widgets/labels/label_h4.dart';
import 'package:restart_app/restart_app.dart';

class CardListError extends StatefulWidget {
  const CardListError({super.key, this.error});

  final String? error;

  @override
  State<CardListError> createState() => _CardListErrorState();
}

class _CardListErrorState extends State<CardListError> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Constants.spacings.spacing16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Constants.images.statusError,
              height: 200,
            ),
            LabelH4(
                label: AppLocalizations.of(context)!.statusError,
                maxLines: 2,
                textAlign: TextAlign.center),
            if (widget.error != null)
              LabelH4(
                label: AppLocalizations.of(context)!.error + widget.error!,
                maxLines: 2,
                textAlign: TextAlign.center,
                color: AppColors.labelSecondaryColor,
              ),
            ButtonText(
              label: "Tentar novamente", 
              action: () {
                Restart.restartApp();
              })
          ],
        ),
      ),
    );
  }
}
