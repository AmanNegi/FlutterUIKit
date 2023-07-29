import 'package:flutter/material.dart';

import 'package:flutter_30_days/globals.dart';
import "package:flutter_30_days/layout/back_layout.dart";

import 'helper.dart';

/// NOTE: Do not copy [SignUpPage] widget
/// Copy the [SignUpWidget] widget

class SignUpPage extends StatefulWidget {
  static const String route = "/SignUpPage";
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late double height, width;
  int currentPageIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return Theme(
        data: ThemeData(
          fontFamily: Theme.of(context).textTheme.displayLarge!.fontFamily,
          primaryColor: SignUpColors.primaryColor,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: buildAppBar(context, width, height),
          body: BackLayout(
            size: Size(width, height),
            child: SignUpWidget(width, height),
          ),
        ),
      );
    });
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class SignUpWidget extends StatefulWidget {
  final double height, width;
  const SignUpWidget(this.width, this.height, {super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late double height, width;
  int currentPageIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    height = widget.height;
    width = widget.width;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// If you remove the constructor values
    /// First, Remove the initState above
    /// Then, You can initialize the [height] and [width] variables here
    /// -------------------------------------------------------
    /// Uncomment the below lines to do so:
    /// height = MediaQuery.of(context).size.height;
    /// width = MediaQuery.of(context).size.width;

    return PageView.builder(
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
                  color: SignUpColors.blackColor,
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
            _getNextOrSkipButton(context, index),
          ],
        );
      },
      itemCount: 3,
    );
  }

  Padding _buildTextField(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 0.85 * width,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: TextField(
          onChanged: (v) {
            // Handle value change at every step of signup process
          },
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

  Container _buildIndicators() {
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

  Container _buildCurrentPageIndicator(int index) {
    return Container(
      width: 0.045 * width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: index == currentPageIndex ? listColor[index] : Colors.grey[300],
      ),
    );
  }

  Padding _getNextOrSkipButton(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Text(
            "Skip",
            style: TextStyle(
                color:
                    currentPageIndex == 2 ? Colors.transparent : Colors.black),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              if ((currentPageIndex < 2)) {
                pageController.nextPage(
                    duration: Duration(milliseconds: 250),
                    curve: Curves.easeInOut);
              } else {
                if (isFullScreen(Size(width, height), getSize(context)))
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
    );
  }
}
