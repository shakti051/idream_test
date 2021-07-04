import 'dart:async';
import 'package:flutter/material.dart';
import 'package:idream_test/screens/otp_verification.dart';
import 'package:idream_test/screens/welcome_screen.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loader = false;
  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(children: [
                Text("Enter Your ",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w700))
              ]),
              SizedBox(height: 10),
              Row(children: [Image.asset("images/mobno.png")]),
              SizedBox(height: 4),
              Row(children: [Image.asset("images/send_otp.png")]),
              SizedBox(height: 8),
              SizedBox(width: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Text("+91",style: TextStyle(color: Colors.black87,fontSize: 16))),
                  SizedBox(width: 8),
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Enter'),
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 16),
                      validator: validateMobile,
                      onSaved: (String val) {
                        var _mobile = val;
                      },
                    ),
                  ),
                ],
              ),
              Visibility(
                  visible: (!loader) ? false : true,
                  child: Lottie.asset('images/loader.json', height: 50)),
              SizedBox(height: 20),
              Container(height: 30,
                child: RaisedButton(
                  
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.blueAccent,
                  onPressed: (){
                     setState(() {
                    loader = true;
                  });
                  Timer(Duration(seconds: 3), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtpVerify()),
                    );
                  }); 
                  },
                  child: Text("login")),
              ),
              SizedBox(height: 10),
              Image.asset(
                "images/girl.png",
                height: MediaQuery.of(context).size.height * .45,
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: 10),
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen())),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Image.asset("images/google.png"))),
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen())),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child:
                                          Image.asset("images/facebook.png"))),
                            ),
                            Image.asset("images/selecting.png"),
                            SizedBox(height: 20),
                          ],
                        );
                      });
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("more login option ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                      Icon(Icons.keyboard_arrow_up, size: 16)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
