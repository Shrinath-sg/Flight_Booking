import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travelapp/Common/colors.dart';
import 'package:travelapp/Common/strings.dart';
import 'package:travelapp/Components/RaisedButton.dart';
import 'package:travelapp/Screens/Login_Screen/Login.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen() : super();

  final String title = "Welcome Screen";

  @override
  WelcomeState createState() => WelcomeState();
}

class WelcomeState extends State<WelcomeScreen> {

  CarouselSlider carouselSlider;
  int _current = 0;

  List<T> map<T>(List list, Function handler) {  //this function maps the screen to their respective circle or dot index.
    List<T> result = [];
    try {
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }
    catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;  //it takes height of current screen and store in height variable
    final width = MediaQuery.of(context).size.width;  //it takes width of current screen and store in width variable

    Widget _changeMode(
        {double sliderHeight, sliderWidth, double buttonHt, double buttonWt}) {
      return Stack(fit: StackFit.expand, children: <Widget>[ //Stack allow us to build the widget by placing them on top of each other
           Container(
            //color: Colors.pinkAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                carouselSlider = CarouselSlider(
                  height: sliderHeight,
                  //aspectRatio: 16 / 9,
                  initialPage: 0,
                  enlargeCenterPage: true,   //it enlarges the front image  in slider
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 4),
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  pauseAutoPlayOnTouch: Duration(seconds: 6),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  items: Strings.imgList.map((imgUrl) {
                    return Builder(
                      builder: (BuildContext context) {  // it takes the building context from url that we given and builds the image
                        return Container(
                          width: sliderWidth,
                          margin: EdgeInsets.symmetric(horizontal: 0),
                          decoration: BoxDecoration(
                            color: CustomColors.lightPink,
                          ),
                          child: Image.network(
                            imgUrl,
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(Strings.imgList, (index, url) {
                    return Container(
                      width: 14.0,
                      height: 10.0,
                      margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? CustomColors.pinkColor
                            : CustomColors.lightPink,
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Container(
                      height: buttonHt,
                      width: buttonWt,
                      // color: Colors.yellow,
                      child: CustomRiasedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                        },
                        text: (Strings.StartBooking),
                      )),
                ),
              ],
            ),
          ),
      ]);
    }
    return Scaffold(
      body: OrientationBuilder(
        // ignore: missing_return
          builder: (context, orientation) {
            try {
              if (orientation == Orientation.portrait) {
                return _changeMode(
                    sliderHeight: height * 0.55,
                    buttonHt: height * 0.07,
                    buttonWt: width * 0.60,
                    sliderWidth: width);
              } else {
                return _changeMode(
                    sliderHeight: width * 0.32,
                    buttonHt: width * 0.07,
                    buttonWt: height * 0.60,
                    sliderWidth: width * 0.58);
              }
            }
            catch(e){
              print(e);
            }

          }


      ),
    );
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 900), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 900), curve: Curves.decelerate);
  }
}
