import 'package:flutter/material.dart';
import 'package:travelapp/Common/TextColors.dart';
import 'package:travelapp/Common/strings.dart';
import 'package:travelapp/Components/ImageCards.dart';

class VerticalScrollImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    //throw UnimplementedError();
    return Container(
      // color: Colors.yellow,
      //height: height * 0.40,
      child: Column(
        children: [

          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.PopularPlaces,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: CustomTextColors.Indigo),
                ),
              ),
              SizedBox(
                width: width * 0.38,
              ),
              Container(
                child: Text(
                  Strings.ViewAll,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CustomTextColors.pink),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(padding: const EdgeInsets.only(right: 15),

           // color: Colors.black,
            //color: Colors.amber,
            child: Column(
              //scrollDirection: Axis.vertical,
              children: [
                ImageCard(
                  image: Strings.imgList2[4],
                  Location: Strings.LocationList[4],
                  Country: Strings.CountryList[4],
                  Width: width*0.95,
                  ImgWidth: width*0.92,
                ),
                SizedBox(
                  height: width * 0.03,
                ),
                ImageCard(
                  image: Strings.imgList2[2],
                  Location: Strings.LocationList[2],
                  Country: Strings.CountryList[2],

                ),
                SizedBox(
                  height: width * 0.03,
                ),
                ImageCard(
                  image: Strings.imgList2[1],
                  Location: Strings.LocationList[1],
                  Country: Strings.CountryList[1],
                ),
                SizedBox(
                  height: width * 0.03,
                ),
                ImageCard(
                  image: Strings.imgList2[3],
                  Location: Strings.LocationList[3],
                  Country: Strings.CountryList[3],
                ),
                SizedBox(
                  height: width * 0.03,
                ),
                ImageCard(
                  image: Strings.imgList2[0],
                  Location: Strings.LocationList[0],
                  Country: Strings.CountryList[0],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
