import 'package:flutter/material.dart';
import 'package:flutter_movies/themes/colors.dart';

class ViewDetailLoading extends StatelessWidget {
  const ViewDetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(color: AppColors.tertiaryColor));
  }
}
