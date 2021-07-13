import 'package:flutter/material.dart';
import 'package:travelapp/Common/TextColors.dart';
import 'package:travelapp/Common/strings.dart';
import 'package:travelapp/Screens/Home_Screen/Bottom_navigation_Bar.dart';
import 'package:travelapp/Screens/Home_Screen/Horizontal_Scroll_Icons.dart';
import 'package:travelapp/Screens/Home_Screen/Horizontal_scroll_Images.dart';
import 'package:travelapp/Screens/Home_Screen/Vertical_Scroll_Images.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBarScreen(),
      body: SafeArea(
          child: ListView(children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          //color: Colors.deepPurpleAccent,
          //height: height,
          child: Column(children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                Strings.Home,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: CustomTextColors.Indigo),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            HorizontalScrollIcons(),

            HorizontalScrollImages(),
            SizedBox(
              height: height * 0.01,
            ),
            VerticalScrollImages(),
          ]),
        ),
      ])),
    );
  }
}
