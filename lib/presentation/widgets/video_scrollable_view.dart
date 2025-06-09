import 'package:flutter/material.dart';
import 'package:master_ifab/config/config.dart';
import 'package:master_ifab/presentation/widgets/widgets.dart';

class VideoScrollableView extends StatelessWidget {

final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos
    });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack( 
          children: [

            SizedBox.expand(
              child: FullScreenPlayer( 
                descriptio: videoPost.descriptio,
                videoUrl: videoPost.videoUrl,
               )
            ),
            
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost),)
            
          ],
        );
      },
    );
  }
}