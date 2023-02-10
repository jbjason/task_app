import 'package:flutter/material.dart';
import 'package:task_app/widgets/h_video_widget.dart';
import 'package:video_player/video_player.dart';

class HVideoPlayer extends StatefulWidget {
  const HVideoPlayer({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  State<HVideoPlayer> createState() => _HVideoPlayerState();
}

class _HVideoPlayerState extends State<HVideoPlayer> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller!.play());
  }

  @override
  Widget build(BuildContext context) {
    final isMute = _controller!.value.volume == 0;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          // video player
          HVideoWidget(controller: _controller),
          // volume button
          Positioned(top: 10, right: 10, child: _muteButton(isMute)),
        ],
      ),
    );
  }

  Widget _muteButton(bool isMute) {
    if (_controller != null && _controller!.value.isInitialized) {
      return CircleAvatar(
        backgroundColor: Colors.black26,
        radius: 55,
        child: IconButton(
          icon: Icon(isMute ? Icons.volume_mute : Icons.volume_up,
              color: Colors.white),
          onPressed: () => _controller!.setVolume(isMute ? 1 : 0),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
