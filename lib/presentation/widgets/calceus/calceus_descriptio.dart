import 'package:flutter/material.dart';

class CalceusDescriptio extends StatelessWidget {

  final String titulus;
  final String descriptio;

  const CalceusDescriptio({
    required this.titulus,
    required this.descriptio,
    
    super.key
    });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text(titulus,
          style: TextStyle(fontFamily: "CupertinoSystemDisplay", fontSize: 30, fontWeight: FontWeight.w700),),

          SizedBox(height: 10,),
          Text(descriptio,
          style: TextStyle(fontFamily: "CupertinoSystemText",height: 1.6, )),
        ],
      ),
    );
  }
}