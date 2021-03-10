import 'package:Flutter30Days/helper/hex_code.dart';
import 'package:Flutter30Days/pages/home_pages/explore_page.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mdi/mdi.dart';

class WalkthroughCountManager {
  int index;
  List<Color> listColor;
  List<String> _titleText = [
    "What is your\nname?",
    "What skills\ndo you have?",
    "When were\nyou born?"
  ];

  List<String> _hintText = ["Name", "Skills", "Date-Month-Year"];

  int maxIndex = 2;
  WalkthroughCountManager() {
    this.index = 0;
    listColor = [
      HexColor("#7541ee"),
      HexColor("#f4b512"),
      HexColor("#fa517a"),
    ];
  }
  bool comapare(int toCheckIndex) => index == toCheckIndex;
  Color getCurrentColor() => listColor[index];
  bool checkIfLast() => index == maxIndex;
  String getTitleText() => _titleText[index];
  String getHintText() => _hintText[index];
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  double height, width;
  WalkthroughCountManager walkthroughCountManager =
      new WalkthroughCountManager();
  SvgPicture picture = SvgPicture.asset("assets/svg/people.svg");

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      backgroundColor: Colors.white.withOpacity(0.25),
      // _color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 0.05 * height),
          Center(
            child: Text(
              walkthroughCountManager.getTitleText(),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 0.4 * height,
            width: 0.75 * width,
            child: picture,
          ),
          _buildTextField(walkthroughCountManager.getHintText()),
          Spacer(),
          Container(
            height: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCurrentPageIndicator(0),
                SizedBox(width: 0.0275 * width),
                _buildCurrentPageIndicator(1),
                SizedBox(width: 0.0275 * width),
                _buildCurrentPageIndicator(2),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  "Skip",
                  style: TextStyle(
                      color: walkthroughCountManager.checkIfLast()
                          ? Colors.transparent
                          : Colors.white),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (!walkthroughCountManager.checkIfLast()) {
                      walkthroughCountManager.index++;
                      setState(() {});
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExplorePage(),
                          ));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: walkthroughCountManager.getCurrentColor(),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 10,
                      ),
                      child: Text(
                        walkthroughCountManager.checkIfLast()
                            ? "Continue"
                            : "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildTextField(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 0.85 * width,
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          ),
        ),
      ),
    );
  }

  _buildCurrentPageIndicator(int index) {
    return Container(
      width: 0.045 * width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: walkthroughCountManager.comapare(index)
            ? Colors.white
            : Colors.grey,
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Mdi.chevronLeft)),
      title: Text("Sign Up"),
      actions: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Mdi.sortVariant),
          ),
        ),
      ],
    );
  }
}
