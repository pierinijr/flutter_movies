import 'package:flutter/material.dart';

class ViewDetail extends StatefulWidget {
  const ViewDetail({
    super.key,
    required this.movieId
  });

  final int movieId;

  @override
  State<ViewDetail> createState() => _ViewDetailState();
}

class _ViewDetailState extends State<ViewDetail> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.movieId.toString());
    return Container();
  }
}