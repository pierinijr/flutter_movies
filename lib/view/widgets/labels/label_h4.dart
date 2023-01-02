import 'package:flutter/material.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view/widgets/labels/label_base.dart';

class LabelH4 extends LabelBase {
  const LabelH4({
    Key? key,
    required label,
    overflow = TextOverflow.ellipsis,
    maxLines = 1,
    fontWeightType = FontWeight.normal,
    color = AppColors.labelPrimaryColor,
    height = 1.5,
    textAlign = TextAlign.start
  }) : super(
            key: key,
            label: label,
            overflow: overflow,
            maxLines: maxLines,
            fontSize: 16,
            height: height,
            fontWeightType: fontWeightType,
            color: color,
            textAlign: textAlign
            );
}