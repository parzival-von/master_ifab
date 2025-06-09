import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String descriptio;

  const FullScreenPlayer
  ({super.key,
  required this.videoUrl,
  required this.descriptio,

  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

late VideoPlayerController controller;

 @override
  void initState() {

    controller = VideoPlayerController.asset(widget.videoUrl)
    ..setVolume(0)
    ..setLooping(true)
    ..play();


    super.initState();
  }

  @override
  void dispose() {

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder:(context, snapshot) {
        if(snapshot.connectionState != ConnectionState.done){
          return const Center( child: CircularProgressIndicator(strokeWidth: 2,),);
        }
          return GestureDetector(
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(controller), 
                  Positioned(
                    left: 20,
                    bottom: 50,
                    child: _VideoDescriptio(decriptio: widget.descriptio))
                ],
              )
              ),
              onTap: () {
                if(controller.value.isPlaying){
                  controller.pause();
                  return;
                }
                controller.play();
              },
          );


      } ,
    );
  }
}


class _VideoDescriptio extends StatelessWidget {

final String decriptio;

  const _VideoDescriptio({
    required this.decriptio
  });

  @override
  Widget build(BuildContext context) {

    final magnitudine = MediaQuery.of(context).size;

    return SizedBox(
      width: magnitudine.width * 0.6,
      child: Text(decriptio,
      maxLines: 2, 
      style: TextStyle(color: Colors.white),),
    );
  }
}