import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper/hex_code.dart';
import 'package:mdi/mdi.dart';

class AdventurePage extends StatefulWidget {
  @override
  _AdventurePageState createState() => _AdventurePageState();
}

class _AdventurePageState extends State<AdventurePage> {
  Color _hexColor = HexColor("#56756d");
  double height, width;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomNavItem(0, Mdi.compass),
            _buildBottomNavItem(1, Mdi.grid),
            _buildBottomNavItem(2, Mdi.chat),
            _buildBottomNavItem(3, Mdi.homeAnalytics),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: 0.05 * height,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                child: Row(
                  children: [
                    Text(
                      "Good Morning",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/person1.jpg"),
                    ),
                  ],
                ),
              ),
            ),
            _buildRichText(),
            Container(
              height: 0.5175 * height,
              width: width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildItem(1),
                  _buildItem(2),
                  _buildItem(4),
                  _buildItem(3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildBottomNavItem(int index, IconData icon) {
    return GestureDetector(
      onTap: () {
        this._currentIndex = index;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: index == _currentIndex ? _hexColor : Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 12.0,
          ),
          child: Icon(
            icon,
            color: index == _currentIndex
                ? Colors.white
                : _hexColor.withOpacity(0.6),
          ),
        ),
      ),
    );
  }

  _buildItem(int count) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 0.65 * width,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8.0,
                        offset: Offset(6.0, 6.0),
                        spreadRadius: 5.0),
                  ],
                  image: DecorationImage(
                    image: AssetImage("assets/$count.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      SizedBox(width: double.infinity),
                      Text(
                        "Lagi Di Brenas",
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        "Iceland",
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0.1 * width,
            child: Container(
              height: 0.125 * width,
              width: 0.125 * width,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: _hexColor),
              child: Center(
                child: Text(
                  "GO",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildRichText() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: RichText(
        text: TextSpan(
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 30,
            ),
            children: [
              TextSpan(
                  text: "The Best",
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.black)),
              TextSpan(
                  text: "\nadventure trips\nIn the world",
                  style: TextStyle(color: Colors.black)),
            ]),
      ),
    );
  }
}
