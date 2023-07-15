import 'package:flutter/material.dart';
import '../helper/hex_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../layout/back_layout.dart';
import 'package:flutter_30_days/globals.dart';

class FurnitureDetailPage extends StatefulWidget {
  static const String route = "/FurnitureDetailPage";
  @override
  _FurnitureDetailPageState createState() => _FurnitureDetailPageState();
}

class _FurnitureDetailPageState extends State<FurnitureDetailPage> {
  Color mainColor = HexColor("#21a5a7");
  late double height, width;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return Theme(
        data: ThemeData(
          primaryColor: mainColor,
          primarySwatch: Colors.cyan,
          fontFamily: GoogleFonts.quicksand().fontFamily,
        ),
        child: Scaffold(
          body: BackLayout(
            size: Size(width, height),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?crop&w=1080&q=80",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text("Special Offer 40% off"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Shop By Room",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                              fontFamily: GoogleFonts.quicksand().fontFamily,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Text(
                            "Small Space? No Problem, Make the room feel bigger with smart lighting",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 0.09 * height,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Shop Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      if (isFullScreen(Size(width, height), getSize(context)))
                        Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Icon(
                        MdiIcons.chevronLeft,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
