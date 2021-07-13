import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp/Common/TextColors.dart';
import 'package:travelapp/Common/colors.dart';
import 'package:travelapp/Common/strings.dart';
import 'package:travelapp/Components/RaisedButton.dart';
import 'package:travelapp/Screens/Home_Screen/Bottom_navigation_Bar.dart';
import 'package:travelapp/Screens/Home_Screen/Home.dart';
import 'package:travelapp/Screens/SignUpScreen/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travelapp/services/services.dart';
class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return LoginState();
  }
}

class LoginState extends State<Login> {

  SharedPreferences logindata;
  bool newuser;

  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String email;

  // bool Email = false;
  String _password;

  // bool _interchange = false;

  // Toggles the password show status
  void Validator() {}

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    }

  }

  @override

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    String Validate(String value) {
      try {
        if (value.isEmpty) {
          return 'Please a Enter';
        }
        if (!RegExp(Strings.Regexp).hasMatch(value)) {
          return 'Please a valid Email ';
        }
        return null;
      } catch (e) {
        print(e);
      }
    }

    Widget _changeMode(
        {double SizeBox1Ht,
        double SizeBox2Ht,
        double SizeBox3Ht,
        double SizeBox4Ht,
        double LoginHt,
        double ButtonHt,
        double ButtonWt}) {
      return Stack(
          fit: StackFit.expand, children: <Widget>[
        ListView(
            //color: Colors.green,
            children: [
              Center(
                child: Container(
                  // height: height,
                  width: width * 0.88,
                  // margin: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [

                      SizedBox(
                        height: SizeBox1Ht,
                      ),
                      Container(
                        // color: Colors.yellow,
                        //color: Colors.pink,
                        height: LoginHt,
                        width: width,
                        child: Row(children: [
                          Text(
                            Strings.Login,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                color: CustomTextColors.Indigo),
                          )
                        ]),
                      ),
                      SizedBox(
                        height: SizeBox2Ht,
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          child: Column(children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            TextFormField(
                              validator: Validate,
                              //Calling Validate function

                              onSaved: (String value) {
                                email = value;
                              },
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    // child: Icon(Icons.done),
                                    child: InkWell(child: Icon(Icons.done)),
                                  ),
                                  //border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      color: CustomTextColors.greyColor,
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.w600)),
                            ),

                            // CustomTextFeild(
                            //   Text: Strings.Email,
                            //   Icons: Icons.wifi_protected_setup,
                            // )),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Container(
                              child: TextFormField(
                                // ignore: missing_return
                                validator: (value) {
                                  try {
                                    if (value.isEmpty) {
                                      return 'Please Enter Valid Password';
                                    }
                                    return null;
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                style: TextStyle(color: Colors.black),
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: _toggle,
                                      child: Icon(_obscureText
                                          ? Icons.remove_red_eye
                                          : Icons.visibility_off),
                                    ),
                                    //border: OutlineInputBorder(),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        color: CustomTextColors.greyColor,
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w600)),
                              ),
                              // CustomTextFeild(
                              //   Text: Strings.Password,
                              //   Icons: Icons.remove_red_eye,
                              // )
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            Strings.forgotPassword,
                            style: TextStyle(
                                fontSize: 16,
                                color: CustomTextColors.greyColor),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Container(
                            height: ButtonHt,
                            width: ButtonWt,
                            // color: Colors.yellow,
                            child: CustomRiasedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {}
                              },
                              text: (Strings.LoginButton),
                            )),
                      ),
                      SizedBox(
                        height: SizeBox3Ht,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: InkWell(
                              child: CircleAvatar(
                                  child: Image.network(Strings.FbImage),
                                  radius: 25),
                              onTap: () {},
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            child: InkWell(
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Image.network(Strings.GoogleImage),
                                  radius: 25),
                              onTap: () {
                                handleSignIn().whenComplete(() {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return BottomNavigationBarScreen();
                                    }
                                    ),);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: Text(
                        Strings.LoginWith,
                        style: TextStyle(
                            fontSize: 16,
                            color: CustomTextColors.greyColor,
                            fontWeight: FontWeight.w800),
                      )),
                      SizedBox(height: SizeBox4Ht),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Strings.HaveAccount,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: CustomTextColors.greyColor),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            InkWell(
                              child: Text(
                                Strings.SignUpLink,
                                style: TextStyle(
                                    color: CustomColors.pinkColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              onTap: (){ Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));},
                            ),
                          ]),
                      SizedBox(height: height * 0.01),
                      Text(Strings.Skip,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: CustomTextColors.greyColor)),
                    ],
                  ),
                ),
              ),
            ]),
      ]);
    }

    // TODO: implement build
    //throw UnimplementedError();

    return Scaffold(
      // ignore: missing_return
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          //it checks the current orientation of device amd accordingly changes the widget size
          return _changeMode(
              SizeBox1Ht: height * 0.16,
              SizeBox2Ht: height * 0.02,
              SizeBox3Ht: height * 0.08,
              SizeBox4Ht: height * 0.06,
              LoginHt: width * 0.20,
              ButtonHt: height * 0.07,
              ButtonWt: width * 0.80);
        } else {
          return _changeMode(
              SizeBox1Ht: height * 0.0,
              SizeBox2Ht: height * 0.0,
              SizeBox3Ht: height * 0.02,
              LoginHt: height * 0.10,
              ButtonHt: width * 0.07,
              ButtonWt: height * 0.80);
        }
      }),
    );
  }
}
