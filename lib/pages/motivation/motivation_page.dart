import 'package:flutter/material.dart';

import 'package:flutter_ui_kit/pages/motivation/helper.dart';
import 'package:flutter_ui_kit/helper/hex_code.dart';
import 'package:flutter_ui_kit/layout/back_layout.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

/// NOTE: Do not copy [MotivationPage] widget
/// Copy the [MotivationWidget] widget

class MotivationPage extends StatefulWidget {
  static const String route = "/MotivationPage";
  @override
  _MotivationPageState createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;

      return Theme(
        data: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BackLayout(
            size: Size(width, height),
            child: MotivationWidget(width, height),
          ),
        ),
      );
    });
  }
}

/// NOTE: Copy the below widget
/// Remember to wrap the contents in a [Scaffold] widget
/// You can remove the contructor values [height] and [width]

class MotivationWidget extends StatefulWidget {
  static final Color mainColor = Color(0xFFed714f);
  static final Color secondaryColor = Color(0xFFf9fafc);

  final double height, width;

  const MotivationWidget(this.width, this.height, {super.key});

  @override
  State<MotivationWidget> createState() => _MotivationWidgetState();
}

class _MotivationWidgetState extends State<MotivationWidget> {
  late double height, width;

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

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tips & Strategies",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Motivation",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                          color: Colors.grey[700]),
                    ),
                    Spacer(),
                    Text(
                      "Watch all",
                      style: TextStyle(color: MotivationWidget.mainColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 0.375 * height,
            width: double.infinity,
            child: ListView(
              padding: EdgeInsets.only(left: 15.0),
              scrollDirection: Axis.horizontal,
              children: [
                _buildItem(listImages[0], "When you wake up"),
                _buildItem(listImages[1], "Say Thanks"),
                _buildItem(listImages[2], "Be Well"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Text(
              "Support",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
                color: Colors.grey[700],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: MotivationWidget.secondaryColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(
                  MdiIcons.foodApple,
                  color: HexColor("#7fd3cc"),
                ),
                SizedBox(width: 10),
                Text(
                  "Diets",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: MotivationWidget.secondaryColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(
                  MdiIcons.weightLifter,
                  color: HexColor("#e3866e"),
                ),
                SizedBox(width: 10),
                Text(
                  "Exercises",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: MotivationWidget.secondaryColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(
                  MdiIcons.meditation,
                  color: Color(0xFF764ba2),
                ),
                SizedBox(width: 10),
                Text(
                  "Meditation",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: MotivationWidget.secondaryColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(
                  MdiIcons.yoga,
                  color: HexColor("#50a7c2"),
                ),
                SizedBox(width: 10),
                Text(
                  "Yoga",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildItem(String image, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, top: 10.0, bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0.0, 0.0),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: 0.475 * width,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 0.475 * width,
                    height: double.infinity,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black87,
                        Colors.black54,
                        Colors.transparent,
                        Colors.transparent,
                      ],
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            text,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
