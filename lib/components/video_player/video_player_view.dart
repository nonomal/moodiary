import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit_video/media_kit_video.dart';

import 'video_player_logic.dart';
import 'video_player_state.dart';

class VideoPlayerComponent extends StatelessWidget {
  final String videoPath;

  const VideoPlayerComponent({super.key, required this.videoPath});

  @override
  Widget build(BuildContext context) {
    final VideoPlayerLogic logic = Get.put(VideoPlayerLogic(videoPath: videoPath), tag: videoPath);
    final VideoPlayerState state = Bind.find<VideoPlayerLogic>(tag: videoPath).state;
    final colorScheme = Theme.of(context).colorScheme;

    Widget buildCustomTheme({required Widget child}) {
      if (Platform.isAndroid || Platform.isIOS) {
        return MaterialVideoControlsTheme(
          normal: kDefaultMaterialVideoControlsThemeData.copyWith(
              seekBarPositionColor: colorScheme.primary,
              seekBarThumbColor: colorScheme.primary,
              seekBarMargin: const EdgeInsets.all(8.0)),
          fullscreen: kDefaultMaterialVideoControlsThemeDataFullscreen.copyWith(
            seekBarPositionColor: colorScheme.primary,
            seekBarThumbColor: colorScheme.primary,
          ),
          child: child,
        );
      } else {
        return MaterialDesktopVideoControlsTheme(
          normal: kDefaultMaterialDesktopVideoControlsThemeData.copyWith(
            seekBarPositionColor: colorScheme.primary,
            seekBarThumbColor: colorScheme.primary,
          ),
          fullscreen: kDefaultMaterialDesktopVideoControlsThemeData.copyWith(
            seekBarPositionColor: colorScheme.primary,
            seekBarThumbColor: colorScheme.primary,
          ),
          child: child,
        );
      }
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: GetBuilder<VideoPlayerLogic>(
        assignId: true,
        tag: videoPath,
        builder: (_) {
          return Chewie(controller: logic.chewieController);
        },
      ),
    );
  }
}