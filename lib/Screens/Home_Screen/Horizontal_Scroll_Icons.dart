import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travelapp/Common/colors.dart';
import 'package:travelapp/Common/strings.dart';
import 'package:travelapp/Components/Circle_icon.dart';

class HorizontalScrollIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    //throw UnimplementedError();
    return Container(
      //color: Colors.amberAccent,
      width: width,
      height: height * 0.15,
      //color: Colors.amber,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          //SizedBox(width: width*0.08,),
          CircularIcons(
            iconData: Icons.airplanemode_active,
            Color: Colors.red,
            text: Strings.Flight,
            tagnum: '1',
            Rotate: 30 * pi / 180,
          ),
          SizedBox(
            width: width * 0.08,
          ),
          CircularIcons(
            iconData: Icons.hotel,
            Color: CustomColors.GreenColor,
            text: Strings.Hotel,
            tagnum: '2',
            Rotate: 360*pi/180,
          ),
          SizedBox(
            width: width * 0.08,
          ),
          CircularIcons(
            iconData: Icons.directions_car,
            Color: CustomColors.PurpleColor,
            text: Strings.Car,
            tagnum: '3',
            Rotate: 360*pi/180,
          ),
          SizedBox(
            width: width * 0.08,
          ),
          CircularIcons(
            iconData: Icons.restaurant_menu,
            Color: CustomColors.PinkColor,
            text: Strings.Restaurant,
            tagnum: '4',
            Rotate: 360*pi/180,
          ),
          SizedBox(
            width: width * 0.08,
          ),
          CircularIcons(
            iconData: Icons.directions_walk_sharp,
            Color: CustomColors.SkyBlue,
            // Color: Colors.cyan,
            text: Strings.Guide,
            tagnum: '5',
            Rotate: 360*pi/180,
          )
        ],
      ),
    );
  }
}
