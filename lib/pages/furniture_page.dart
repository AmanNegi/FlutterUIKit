import 'package:flutter/material.dart';

import '../helper/hex_code.dart';
import '../layout/back_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'furniture_detail_page.dart';

class FurniturePage extends StatefulWidget {
  static const String route = "/FurniturePage";

  @override
  _FurniturePageState createState() => _FurniturePageState();
}

String bannerImage =
    "https://images.unsplash.com/photo-1524758631624-e2822e304c36?crop&w=1050&q=80";
Color mainColor = HexColor("#eeb901");
Color disabledColor = HexColor("#494949");

class _FurniturePageState extends State<FurniturePage> {
  double height, width;

  List<String> horizontalList = [
    "https://images.unsplash.com/photo-1603794067602-9feaa4f70e0c?crop&w=920&q=80",
    "https://images.unsplash.com/photo-1610123172705-a57f116cd4d9?crop&w=920&q=80",
    "https://images.unsplash.com/photo-1600494448644-50b41080adbd?crop&w=920&q=80"
  ];
  List<String> horizontalNameList = ["Living Space", "Dining Room", "Bedroom"];

  List<String> imageList = [
    "https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?crop&w=334&q=80",
    "https://images.unsplash.com/photo-1519947486511-46149fa0a254?crop&w=334&q=80",
    "https://images.unsplash.com/photo-1501045661006-fcebe0257c3f?crop&w=334&q=80",
    "https://images.unsplash.com/photo-1551298370-9d3d53740c72?crop&w=334&q=80"
  ];
  List<String> nameList = ["Italian", "Classical", "Roman", "Kobalia"];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;

      return Theme(
        data: ThemeData(
          primaryColor: mainColor,
          primarySwatch: Colors.amber,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        child: Scaffold(
          body: BackLayout(
            size: Size(width, height),
            child: _buildBody(),
          ),
        ),
      );
    });
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 20),
          _buildSearchBar(),
          SizedBox(height: 10),
          _buildBanner(),
          SizedBox(height: 10),
          _buildHeading("Category by Style"),
          SizedBox(height: 10),
          Container(
            height: 0.2 * height,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(imageList.length,
                    (index) => _buildItem(nameList[index], imageList[index]))),
          ),
          SizedBox(height: 10),
          _buildHeading("More Ideas"),
          SizedBox(height: 10),
          Container(
            height: 0.225 * height,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                horizontalList.length,
                (index) => _buildHorizontalItem(
                  horizontalNameList[index],
                  horizontalList[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildHorizontalItem(String text, String image) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
      child: GestureDetector(
        // onTap: () => Navigator.of(context).pushNamed(FurnitureDetailPage.route),
        //* TODO: Closed interlinking of pages
        onTap: () {},
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  image,
                  width: 0.25 * height,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(text)
          ],
        ),
      ),
    );
  }

  _buildItem(String text, String image) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(FurnitureDetailPage.route),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  image,
                  width: 0.145 * height,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(text)
          ],
        ),
      ),
    );
  }

  _buildHeading(String text) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: mainColor,
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
          Spacer(),
          Text(
            "View All",
            style: TextStyle(color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }

  _buildBanner() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            Container(
              height: 0.25 * height,
              color: Colors.red,
              width: double.infinity,
              child: Image.network(
                bannerImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 0.25 * height,
              width: double.infinity,
              color: Colors.black38,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "SAVE 25%",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Enjoy flash sale & save\n up to 100%",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Text("Buy Now!"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(3.0, 3.0),
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 4.0,
            ),
          ]),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
