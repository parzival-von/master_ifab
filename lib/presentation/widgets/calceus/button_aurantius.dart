import 'package:flutter/material.dart';

class ButtonAurantius extends StatelessWidget {

  final String textus;
  final double altus;
  final double latitus;
  final Color color;

  const ButtonAurantius({
    required this.textus,
    this.altus = 50,
    this.latitus = 50,
    this.color = Colors.orange,
    
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: latitus,
      height: altus,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      child: Text(textus, style: TextStyle(fontFamily: "CupertinoSystemText", color: Colors.white),),
    );
  }
}