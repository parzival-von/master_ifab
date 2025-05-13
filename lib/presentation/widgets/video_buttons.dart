
import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';

class VideoButtons extends StatelessWidget {

  final VideoPost video;

  const VideoButtons({
    super.key,
    required this.video,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite, color: Colors.red,)),
      ],
    );
  }
}