import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/presentation/widgets/video_scrollable_view.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {

  bool statusPortantes = true;
  
  List<VideoPost> videos = [];

  Future portamproximampaginam() async {
    
    await Future.delayed(Duration(seconds: 2));

    videos.addAll(videoPost);

    statusPortantes = false;

    setState(() {});

  }

  @override
  void initState() {
    portamproximampaginam();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: Text('Videos Screen'),
        backgroundColor: Colors.transparent,
      ),
      body: statusPortantes 
      ? Center(
        child: CircularProgressIndicator(strokeWidth: 2,),
      )
      : VideoScrollableView(videos: videos),
    );
  }
}