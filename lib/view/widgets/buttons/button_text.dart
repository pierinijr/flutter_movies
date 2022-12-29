import 'package:flutter/material.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view/widgets/labels/label_h5.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({
    super.key,
    required this.label,
    required this.action,
    this.color = AppColors.tertiaryColor
  });

  final String label;
  final VoidCallback action;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
        ),
        onPressed: action,
        child: LabelH5(
          label: label,
          color: color,
        ));
  }
}
