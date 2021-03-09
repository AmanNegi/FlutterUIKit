import 'package:Flutter30Days/helper/hex_code.dart';
import 'package:Flutter30Days/pages/home_pages/list_page.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentBottomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListPage(),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: kBottomNavigationBarHeight,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBottomNavBarItem(Mdi.viewGridOutline, 0),
                _buildBottomNavBarItem(Mdi.homeOutline, 1),
                _buildBottomNavBarItem(Mdi.bellOutline, 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildBottomNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        currentBottomNavBarIndex = index;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: _isCurrentIndex(index)
              ? LinearGradient(
                  colors: [HexColor("#f6b09b"), HexColor("#f9937c")])
              : null,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Icon(
            icon,
            color: _isCurrentIndex(index) ? Colors.white : Colors.grey,
            size: 27,
          ),
        ),
      ),
    );
  }

  bool _isCurrentIndex(int index) => index == currentBottomNavBarIndex;
}
