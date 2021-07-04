import 'dart:async';

import 'package:flutter/material.dart';
import 'package:idream_test/screens/welcome_screen.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:lottie/lottie.dart';

class OtpVerify extends StatefulWidget {
  @override
  _OtpVerifyState createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  String otp = "";
  bool loader = false;
  bool valid_otp = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          SizedBox(height: 20),
          Row(children: [
            Container(
                margin: EdgeInsets.only(left: 16),
                child: Image.asset("images/otp.png"))
          ]),
          SizedBox(height: 4),
          Row(children: [
            Container(
                margin: EdgeInsets.only(left: 16),
                child: Text("please enter verificaion code sent to 9988999988",
                    style: TextStyle(color: Colors.black54, fontSize: 10)))
          ]),
          SizedBox(height: 20),
          Container(
            child: PinEntryTextField(
              fields: 6,
              onSubmit: (String pin) {
                otp = pin;
              },
            ),
          ),
          Visibility(
              visible: (!loader) ? false : true,
              child: Lottie.asset('images/loader.json', height: 50)),
          SizedBox(height: 20),
          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: valid_otp ? Colors.grey[200] : Colors.pink[100],
              onPressed: () {
                if (otp == '858585') {
                  setState(() {
                    loader = true;
                    valid_otp = true;
                  });
                  Timer(Duration(seconds: 3), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>WelcomeScreen()),
                    );
                  });
                  print("The otp is valid");
                } else {
                  setState(() {
                    valid_otp = false;
                  });
                  print("not valid otp");
                }
              },
              child: Text(
                "Verify OTP",
                style:
                    TextStyle(color: valid_otp ? Colors.black87 : Colors.pink),
              )),
          SizedBox(height: 30),
          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              onPressed: () {},
              child: Text(
                "Resend Otp",
                style: TextStyle(color: Colors.blueAccent),
              )),
          SizedBox(height: 20),
          Image.asset("images/finger.png",width: MediaQuery.of(context).size.width*.8,)
        ],
      ))),
    );
  }
}
