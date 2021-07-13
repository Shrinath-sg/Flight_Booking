import 'package:flutter/material.dart';
import 'package:travelapp/Common/TextColors.dart';
import 'package:travelapp/Common/colors.dart';
import 'package:travelapp/Common/strings.dart';

class ImageCard extends StatelessWidget{
  final double Height;
  final double Width;
  final double ImgWidth;
final String image;
final String Location;
final String Country;
  ImageCard({this.image,this.Location,this.Country,this.Height,this.Width,this.ImgWidth});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    //throw UnimplementedError();
    return Container(
     // color: Colors.blue,
      width: ImgWidth,
      child: Column(
          children: [
            Container(
            height: Height,
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child:ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(image,fit: BoxFit.cover,)),

            ),
          ),
            Container(
              width: Width,
              padding: const EdgeInsets.only(top: 8,left: 8),
             // color: Colors.green,
              alignment: Alignment.bottomLeft,
              child: Text(
                Location,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: CustomColors.Indigo),
              ),
            ),

            Container(
              width: Width,
              padding: const EdgeInsets.only(top: 5,left: 8),
            // color: Colors.pink,
              alignment: Alignment.bottomLeft,
              child: Text(
                Country,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: CustomTextColors.greyColor),
              ),
            ),
          ]
      ),

    );
  }

}