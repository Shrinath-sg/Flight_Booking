import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CircularIcons extends StatelessWidget{
  // final MaterialColor Color;
  var Color;
  final IconData iconData;
  final String text;
  final String tagnum;
  final double Rotate;


  CircularIcons({this.iconData,this.Color,this.text,this.tagnum,this.Rotate});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    //throw UnimplementedError();
    return  Container(
      child: Column(children: [
        FloatingActionButton(
          heroTag: tagnum,
          onPressed: () {},
          child: CircleAvatar(
            backgroundColor: Color,
            child: Transform.rotate(
              angle: Rotate,
              child: Icon(iconData,
                color: Colors.white,
                size: 30,
              ),
            ),
            radius: 45,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Text(text,
          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),
        ),
      ]),
    );
  }

}