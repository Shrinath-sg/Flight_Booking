import 'package:flutter/material.dart';
import 'package:travelapp/Common/TextColors.dart';
import 'package:travelapp/Common/strings.dart';
import 'package:travelapp/Components/ImageCards.dart';

class HorizontalScrollImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    //throw UnimplementedError();
    return Container(
      //color: Colors.yellow,
      height: height * 0.42,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              Strings.BestOffer,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: CustomTextColors.Indigo),
            ),
          ),
          SizedBox(
            height: height * 0.009,
          ),
          Row(
            children: [
              Container(
               // color: Colors.pink,
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.Destination,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: CustomTextColors.greyColor),
                ),
              ),
              SizedBox(
                width: width * 0.22,
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
         Container(
            //color: Colors.black,
            width: width,
            height: height * 0.31,
            //color: Colors.amber,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ImageCard(
                  image: Strings.imgList2[0],
                  Location: Strings.LocationList[0],
                  Country: Strings.CountryList[0],
                  Height:  height*0.22,
                  Width: width*0.70,
                  ImgWidth: width*0.65,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                ImageCard(
                  image: Strings.imgList2[1],
                  Location: Strings.LocationList[1],
                  Country: Strings.CountryList[1],
                  Height:  height*0.22,
                  Width: width*0.60,
                  ImgWidth: width*0.65,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                ImageCard(
                  image: Strings.imgList2[2],
                  Location: Strings.LocationList[2],
                  Country: Strings.CountryList[2],
                  Height:  height*0.22,
                  Width: width*0.60,
                  ImgWidth: width*0.65,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                ImageCard(
                  image: Strings.imgList2[3],
                  Location: Strings.LocationList[3],
                  Country: Strings.CountryList[3],
                  Height:  height*0.22,
                  Width: width*0.60,
                  ImgWidth: width*0.65,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                ImageCard(
                  image: Strings.imgList2[4],
                  Location: Strings.LocationList[4],
                  Country: Strings.CountryList[4],
                  Height:  height*0.22,
                  Width: width*0.60,
                  ImgWidth: width*0.65,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
