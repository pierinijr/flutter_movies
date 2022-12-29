import 'package:flutter/material.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/themes/fonts.dart';

class LabelBase extends StatelessWidget {
  const LabelBase(
      {Key? key,
      required this.fontSize,
      required this.label,
      this.overflow = TextOverflow.ellipsis,
      this.maxLines,
      this.height = 1,
      this.color = AppColors.labelPrimaryColor,
      this.fontWeightType = FontWeight.normal,
      this.textAlign = TextAlign.center})
      : super(key: key);

  final String label;
  final TextOverflow overflow;
  final int? maxLines;
  final FontWeight fontWeightType;
  final double height;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: fontPoppins,
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeightType,
        color: color,
      ),
    );
  }
}
