import 'package:idream_test/constants.dart';
import 'package:idream_test/screens/liquid_swipe.dart';
import 'package:idream_test/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iDream Test',
      theme: ThemeData(primaryColor: Colors.blueAccent),
      routes: <String, WidgetBuilder>{
        LIQUID_ANIMATION: (BuildContext context) => LiquidSwipeDemo(),
        SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}