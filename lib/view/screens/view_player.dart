import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movies/core/constants/constants.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_movies/themes/colors.dart';
import 'package:flutter_movies/view/widgets/labels/label_h4.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ViewPlayer extends StatefulWidget {
  const ViewPlayer({super.key, required this.videoId});

  final String videoId;

  @override
  State<ViewPlayer> createState() => _ViewPlayerState();
}

class _ViewPlayerState extends State<ViewPlayer> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
          autoPlay: true, showLiveFullscreenButton: false),
    );

    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
            child: YoutubePlayer(bottomActions: [
          const SizedBox(width: 14.0),
          CurrentPosition(),
          const SizedBox(width: 8.0),
          ProgressBar(isExpanded: true),
          RemainingDuration(),
          const PlaybackSpeedButton(),
        ], topActions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.all(Constants.spacings.spacing8),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: AppColors.labelPrimaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Constants.spacings.spacing8),
                    child: LabelH4(
                      label: AppLocalizations.of(context)!.back,
                    ),
                  )
                ],
              ),
            ),
          )
        ], controller: controller, showVideoProgressIndicator: true)));
  }
}
