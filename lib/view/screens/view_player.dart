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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
          autoPlay: true, showLiveFullscreenButton: false),
    );

    return YoutubePlayerBuilder(
      player: YoutubePlayer(topActions: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: SystemUiOverlay.values);
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
      ], controller: controller, showVideoProgressIndicator: true),
      builder: (context, player) {
        return SafeArea(
          child: Container(
            child: player,
          ),
        );
      },
    );
  }
}
