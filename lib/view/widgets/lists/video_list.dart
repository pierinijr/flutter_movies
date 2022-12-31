import 'package:flutter/material.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/model/details_model.dart';
import 'package:flutter_movies/view/widgets/cards/card_video.dart';

class VideoList extends StatefulWidget {
  const VideoList({super.key, this.videoList});

  final List<VideoResults>? videoList;

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    if (widget.videoList != null) {
      if (widget.videoList!.isNotEmpty) {
        return ListView.builder(
          primary: false,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.videoList!.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: Constants.spacings.spacing8),
              child: CardVideo(videoDetails: widget.videoList![index]),
            );
          },
        );
      }
    }
    return const SizedBox();
  }
}
