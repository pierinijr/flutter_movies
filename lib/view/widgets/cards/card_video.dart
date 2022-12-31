import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/core/utils.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_movies/model/details_model.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view/widgets/labels/label_h4.dart';
import 'package:flutter_movies/view/widgets/labels/label_h6.dart';

class CardVideo extends StatefulWidget {
  const CardVideo({super.key, required this.videoDetails});

  final VideoResults videoDetails;

  @override
  State<CardVideo> createState() => _CardVideoState();
}

class _CardVideoState extends State<CardVideo> {
  @override
  Widget build(BuildContext context) {
    String publishedAt = AppLocalizations.of(context)!.publishedAt +
        Utils.dateConvert(widget.videoDetails.publishedAt);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Utils.goView(context, "/video", arguments: widget.videoDetails.key);
      },
      child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: Constants.spacings.spacing16),
                child: Container(
                  width: 10,
                  color: AppColors.tertiaryColor,
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelH4(
                        label: widget.videoDetails.name ?? "",
                        maxLines: 2,
                        height: 1.0,
                        fontWeightType: FontWeight.bold,
                      ),
                      LabelH6(
                        label: publishedAt,
                        color: AppColors.labelSecondaryColor,
                      ),
                      LabelH6(
                        label: widget.videoDetails.type,
                        color: AppColors.tertiaryColor,
                        fontWeightType: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
