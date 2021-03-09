//! rename this file
import 'package:Flutter30Days/helper/hex_code.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Color _accentColor = HexColor("#382f80");
  Color _fadedWhite = HexColor("#f5f5f5");
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: _accentColor,
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      backgroundColor: _accentColor,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Mdi.menu,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: width,
                    height: 0.1 * height,
                  ),
                  Text(
                    "Hi Jason",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "What are you looking for?",
                    style: TextStyle(color: Colors.white, fontSize: 21),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              height: 0.6 * height,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Friends",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: 0.125 * height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildFriends(Mdi.account, 0),
                          _buildFriends(Mdi.accountAlert, 1),
                          _buildFriends(Mdi.accountCancel, 2),
                          _buildFriends(Mdi.accountCash, 3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: _fadedWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              height: 0.4 * height,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recent Files",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildIconText("Text Results"),
                    _buildIconText("Resume 2019"),
                    _buildIconText("Presentation for project ABCD"),
                    _buildIconText("Presumed Values"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildIconText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Mdi.adobeAcrobat),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(fontSize: 17),
          ),
          Spacer(),
        ],
      ),
    );
  }

  _buildFriends(IconData iconData, int index) {
    return Container(
        width: 0.2 * width,
        height: 0.2 * width,
        decoration: BoxDecoration(
          color: _fadedWhite,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(
              index % 2 == 0 ? "assets/person1.jpg" : "assets/person2.jpg"),
        )
        // child: Icon(
        //   iconData,
        //   size: 30,
        // ),
        );
  }
}
