import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HVideoWidget extends StatelessWidget {
  final VideoPlayerController? controller;
  const HVideoWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return controller != null && controller!.value.isInitialized
        ? _buildVideo()
        : Container(
            color: Colors.white38,
            child: const Center(child: CircularProgressIndicator()),
          );
  }

  Widget _buildVideo() => Stack(
        children: [
          // video
          VideoPlayer(controller!),
          // play & pause Button
          _playPauseButton(),
        ],
      );

  Widget _playPauseButton() => GestureDetector(
      onTap: () => controller!.value.isPlaying
          ? controller!.pause()
          : controller!.play(),
      child: Center(
        child: controller!.value.isPlaying
            ? const Icon(Icons.pause, size: 38, color: Colors.white)
            : const Icon(Icons.play_circle, size: 38, color: Colors.white),
      ));
}
