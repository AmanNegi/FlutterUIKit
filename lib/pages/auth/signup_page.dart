import 'package:flutter_30_days/helper/hex_code.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import '../../layout/back_layout.dart';
import 'package:flutter_30_days/globals.dart';

class SignUpPage extends StatefulWidget {
  static const String route = "/SignUpPage";
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  double height, width;
  int currentPageIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: BackLayout(
          size: Size(width, height),
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              this.currentPageIndex = index;
              setState(() {});
            },
            controller: pageController,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 0.05 * height),
                  Center(
                    child: Text(
                      titleText[index],
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: HexColor("#101010"),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 0.4 * height,
                    width: 0.75 * width,
                    child: listImage[index],
                  ),
                  _buildTextField(hintText[index]),
                  Spacer(),
                  _buildIndicators(),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          "Skip",
                          style: TextStyle(
                              color: currentPageIndex == 2
                                  ? Colors.transparent
                                  : Colors.black),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            if ((currentPageIndex < 2)) {
                              pageController.nextPage(
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeInOut);
                            } else {
                              if (isFullScreen(
                                  Size(width, height), getSize(context)))
                                Navigator.pop(context);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: listColor[index],
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25.0,
                                vertical: 10,
                              ),
                              child: Text(
                                currentPageIndex == 2 ? "Continue" : "Next",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
            itemCount: 3,
          ),
        ),
      );
    });
  }

  _buildIndicators() {
    return Container(
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
    );
  }

  _buildTextField(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 0.85 * width,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: Colors.black),
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
        color: index == currentPageIndex ? listColor[index] : Colors.grey[300],
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
            if (isFullScreen(Size(width, height), getSize(context)))
              Navigator.pop(context);
          },
          child: Icon(
            Mdi.chevronLeft,
            color: HexColor("#101010"),
          )),
      title: Text(
        "Sign Up",
        style: TextStyle(color: HexColor("#101010")),
      ),
      actions: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Mdi.sortVariant,
              color: HexColor("#101010"),
            ),
          ),
        ),
      ],
    );
  }
}

List<Color> listColor = [
  HexColor("#7541ee"),
  HexColor("#f4b512"),
  HexColor("#fa517a"),
];
List<String> titleText = [
  "What is your\nname?",
  "What skills\ndo you have?",
  "When were\nyou born?"
];

List<String> hintText = ["Name", "Skills", "Date Month Year"];

List<Image> listImage = [
  Image.asset('assets/name.png'),
  Image.asset("assets/music.png"),
  Image.asset("assets/birth.png")
];
