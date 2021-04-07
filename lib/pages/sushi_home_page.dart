import 'package:flutter/material.dart';
import 'package:Flutter30Days/globals.dart';
import 'package:mdi/mdi.dart';
import '../layout/back_layout.dart';
import 'package:google_fonts/google_fonts.dart';

class SushiHomePage extends StatefulWidget {
  static const String route = "/SushiHomePage";
  @override
  _SushiHomePageState createState() => _SushiHomePageState();
}

class _SushiHomePageState extends State<SushiHomePage> {
  double height, width;

  List<SushiItem> listSushiItem = [
    SushiItem("URA-MAKI ROLLS", "assets/sushi1.png"),
    SushiItem("MAKI ROLLS", "assets/sushi4.png"),
    SushiItem("FISH", "assets/sushi2.png"),
    SushiItem("SUSHI", "assets/sushi3.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          extendBodyBehindAppBar: true,
          body: BackLayout(
            size: Size(width, height),
            child: Stack(
              children: [
                Container(
                  height: height,
                  width: double.infinity,
                  color: Colors.grey[100],
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 0.6 * height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 0.2 * height,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Mdi.foodCroissant,
                                size: 150, color: Colors.orange),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "UMAMI",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontFamily:
                                          GoogleFonts.oswald().fontFamily,
                                    ),
                                  ),
                                  Text(
                                    "SUSHI BAR",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.oswald().fontFamily,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.075 * height),
                        Container(
                          height: 0.3 * height,
                          child: ListView(
                              padding: EdgeInsets.only(left: 20.0),
                              scrollDirection: Axis.horizontal,
                              children: List.generate(listSushiItem.length,
                                  (index) => _buildItem(listSushiItem[index]))),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, top: 10.0, bottom: 0.0),
                                child: Text(
                                  "Categories",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.lato().fontFamily,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                              ),
                              Container(
                                height: 0.125 * height,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    _buildInfoItem("Sushi", Mdi.fire),
                                    _buildInfoItem("Pork", Mdi.foodSteak),
                                    _buildInfoItem("Top", Mdi.star),
                                    _buildInfoItem("Veg", Mdi.foodApple),
                                    _buildInfoItem(
                                        "Drinks", Mdi.foodForkDrink),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildInfoItem(String text, IconData icon) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 0.1 * height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontFamily: GoogleFonts.caveat().fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildItem(SushiItem item) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
      width: 0.45 * width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Image.asset(
            item.image,
            height: 0.225 * height,
          ),
          Spacer(),
          Text(
            item.text,
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

class SushiItem {
  String text;
  String image;

  SushiItem(this.text, this.image);
}
