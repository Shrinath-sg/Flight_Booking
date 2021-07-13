import 'dart:async';
import 'package:flutter/material.dart';
import 'package:travelapp/Common/colors.dart';
import 'package:travelapp/Common/strings.dart';
import 'package:travelapp/Screens/Welcome_screen/Welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context)
        .size
        .height; //it takes width of current screen and store in height variable
    final width = MediaQuery.of(context).size.width;

    Widget _changeMode(
        {double containerHeight,
        double containerWidth,
        double img1Width,
        double img2Width}) {
      return Stack(fit: StackFit.expand, children: <Widget>[
          Container(
            width: width,
            height: height,
            color: CustomColors.Indigo,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: img1Width,
                  child: Image.asset(Strings.LogoImage),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: img2Width,
                    child: Image.asset(
                      Strings.LogoTextImage,
                      scale: 0.80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Text("Navana air",style: GoogleFonts.permanentMarker(textStyle:Theme.of(context).textTheme.display1,fontWeight: FontWeight.w400,color: Colors.white))
              ],
            ),
          ),
      ]);
    }

    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      // ignore: missing_return
      body: OrientationBuilder(builder: (context, orientation) {
        try {
          if (orientation == Orientation.portrait) {
            //it checks the current orientation of device amd accordingly changes the widget size
            return _changeMode(
              containerWidth: width,
              containerHeight: height,
              img1Width: width * 0.20,
              img2Width: width * 0.52,
            );
          } else {
            return _changeMode(
                containerWidth: width,
                containerHeight: height,
                img1Width: height * 0.20,
                img2Width: height * 0.52);
          }
        } catch (e) {
          // ignore: missing_return
          print(e);
        }
      }),
    );
  }
}
//MuseoModerno
