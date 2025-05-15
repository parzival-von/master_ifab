import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String descriptio;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.descriptio,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;
  late Future<void> _initFuture;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl);
    _initFuture = controller.initialize().then((_) {
      controller.setVolume(0);
      controller.setLooping(true);
      controller.play();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }
        return SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: controller.value.size.width,
              height: controller.value.size.height,
              child: VideoPlayer(controller),
            ),
          ),
        );
      },
    );
  }
}