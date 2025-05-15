
import 'package:animate_do/animate_do.dart';
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
        // IconButton(onPressed: () {}, icon: Icon(Icons.favorite, color: Colors.red,)),
        _PropriumIconButton( valorem: video.likes, iconData: Icons.favorite, iconColor: Colors.red,),
        const SizedBox(height: 20,),
        _PropriumIconButton( valorem: video.views, iconData: Icons.remove_red_eye_outlined,),
        const SizedBox(height: 20,),
        SpinPerfect( 
          infinite: true,
          duration: Duration(seconds: 5),
          child: _PropriumIconButton(valorem:0, iconData: Icons.play_circle_fill_outlined,))

      ],
    );
  }
}

class _PropriumIconButton extends StatelessWidget {

  final int valorem;
  final IconData iconData;
  final Color? color;

  const _PropriumIconButton({
    required this.valorem,
    required this.iconData,
    iconColor
    }):color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData, color: color, size: 30,)
        ),
        if(valorem > 0)
          Text(
            IntelligibilisForma.novaFormaNumeri(valorem.toDouble()),
            style: TextStyle(color: Colors.white),)
      ],
    );
  }
}