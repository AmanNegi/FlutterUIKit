import 'package:flutter/material.dart';
import '../helper/hex_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdi/mdi.dart';

class FurnitureDetailPage extends StatefulWidget {
  static const String route = "/FurnitureDetailPage";
  @override
  _FurnitureDetailPageState createState() => _FurnitureDetailPageState();
}

class _FurnitureDetailPageState extends State<FurnitureDetailPage> {
  Color mainColor = HexColor("#21a5a7");
  double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Theme(
      data: ThemeData(
        primaryColor: mainColor,
        primarySwatch: Colors.cyan,
        fontFamily: GoogleFonts.quicksand().fontFamily,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?crop&w=1980&q=80",
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
              top: 40,
              left: 10,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(
                    Mdi.chevronLeft,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
