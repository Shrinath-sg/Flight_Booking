import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomRiasedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomRiasedButton({
    @required this.onPressed,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(80))),
      onPressed: onPressed,
      child: Text(text,
        style: TextStyle(fontSize: 20, color: Colors.white),
        // style: GoogleFonts.spartan(
        //     textStyle: Theme.of(context).textTheme.display1,fontSize: 20),
      ),
      color: Colors.pink[300],
    );
  }
}
