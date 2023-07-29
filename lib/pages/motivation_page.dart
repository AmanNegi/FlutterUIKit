import 'package:flutter/material.dart';
import '../helper/hex_code.dart';
import 'package:google_fonts/google_fonts.dart';
import '../layout/back_layout.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MotivationPage extends StatefulWidget {
  static const String route = "/MotivationPage";
  @override
  _MotivationPageState createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {
  Color mainColor = HexColor("#ed714f");
  Color secondaryColor = HexColor("#f9fafc");
  late double height, width;

  List<String> listImages = [
    "https://images.unsplash.com/photo-1574950578143-858c6fc58922?crop&w=1080&q=80",
    "https://images.unsplash.com/photo-1547261363-9ae00c5a9b4e?crop&w=1080&q=80",
    "https://images.unsplash.com/photo-1513682322455-ea8b2d81d418?crop&w=1080&q=80",
  ];

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
            child: _buildBody(context),
          ),
        ),
      );
    });
  }

  _buildBody(BuildContext context) {
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
                      style: TextStyle(color: mainColor),
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
              color: secondaryColor,
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
              color: secondaryColor,
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
              color: secondaryColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(
                  MdiIcons.meditation,
                  color: HexColor("#764ba2"),
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
              color: secondaryColor,
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
