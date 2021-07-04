import 'dart:math';
import 'package:idream_test/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipeDemo extends StatefulWidget {
  static final styke = TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
  @override
  _LiquidSwipeDemoState createState() => _LiquidSwipeDemoState();
}

class _LiquidSwipeDemoState extends State<LiquidSwipeDemo> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  void initState() {
    // TODO: implement initState
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("images/image1.png"),
          SizedBox(
            height: 150,
          ),
          Image.asset("images/explore.png"),
          SizedBox(height: 8),
          Row(
            children: [
              Image.asset("images/ninja.png"),
              SizedBox(width: 10),
              Image.asset("images/hack.png", width: 30, height: 30)
            ],
          ),
          SizedBox(height: 10),
          Image.asset("images/take.png"),
        ],
      ),
    ),
    Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Image.asset("images/study.png"),
          SizedBox(
            height: 150,
          ),
          Image.asset("images/choose.png"),
          SizedBox(height: 8),
          Row(children: [
            Image.asset("images/pro.png"),
            SizedBox(width: 10),
            Image.asset(
              "images/tik.png",
              width: 30,
              height: 30,
            )
          ]),
          SizedBox(height: 10),
          Image.asset("images/no_matter.png")
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("images/focus.png"),
          SizedBox(
            height: 150,
          ),
          Image.asset("images/prepare.png"),
          SizedBox(height: 8),
          Row(children: [
            Image.asset("images/real.png"),
            SizedBox(width: 10),
            Image.asset(
              "images/home.png",
              width: 30,
              height: 30,
            )
          ]),
          SizedBox(height: 10),
          Image.asset("images/show.png")
        ],
      ),
    ),
    Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Image.asset("images/laptop.png"),
          SizedBox(
            height: 150,
          ),
          Text(
            "How can we",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Image.asset("images/help.png", height: 30),
          SizedBox(height: 10),
          Image.asset("images/ready.png")
        ],
      ),
    ),
  ];

  Widget _buildDots(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return Container(
      width: 20,
      child: Center(
        child: Material(
          color: Colors.black,
          type: MaterialType.card,
          child: Container(
            width: 6.0 * zoom,
            height: 6.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            LiquidSwipe(
              pages: pages,
              liquidController: liquidController,
              enableLoop: true,
              enableSlideIcon: true,
              fullTransitionValue: 600,
              positionSlideIcon: 0.5,
              waveType: WaveType.liquidReveal,
              ignoreUserGestureWhileAnimating: true,
              onPageChangeCallback: pageChangeCallback,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(pages.length, _buildDots),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: FlatButton(
                  onPressed: () {
                    if (page == pages.length - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      liquidController.jumpToPage(
                          page: liquidController.currentPage + 1);
                    }
                  },
                  child: page == pages.length - 1 ? Text("Next") : null,
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, right: 25),
                child: FlatButton(
                  onPressed: () {
                    liquidController.animateToPage(
                        page: pages.length - 1, duration: 500);
                  },
                  child: page == pages.length - 1 ? null : Text("Skip"),
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
