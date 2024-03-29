import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_ui_kit/layout/back_layout.dart';
import 'package:flutter_ui_kit/pages/trip/helper.dart';

/// NOTE: Do not copy [TripPage] widget
/// Copy the [TripWidget] widget

class TripPage extends StatefulWidget {
  static const String route = "/TripPage";
  @override
  _TripPageState createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        width = constraints.maxWidth;
        height = constraints.maxHeight;
        return Theme(
          data: ThemeData(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            primaryColor: TripWidget.mainColor,
            fontFamily: GoogleFonts.zillaSlab().fontFamily,
          ),
          child: Scaffold(
            body: BackLayout(
              size: Size(width, height),
              child: TripWidget(width, height),
            ),
          ),
        );
      },
    );
  }
}

class TripWidget extends StatefulWidget {
  static final Color mainColor = Color(0xFF174f44);

  final double height, width;
  const TripWidget(this.width, this.height, {super.key});

  @override
  State<TripWidget> createState() => _TripWidgetState();
}

class _TripWidgetState extends State<TripWidget> {
  late double height, width;

  TextStyle whiteTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  @override
  void initState() {
    height = widget.height;
    width = widget.width;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundAndTopBar(context),
        _buildRecommendedTripsCard(),
      ],
    );
  }

  _buildRecommendedTripsCard() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: 0.675 * height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Recommended Trips",
                style: TextStyle(
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: 0.375 * height,
              width: double.infinity,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 15.0),
                scrollDirection: Axis.horizontal,
                itemCount: tripList.length,
                itemBuilder: (context, index) => _buildItem(tripList[index]),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey.shade100,
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Icon(MdiIcons.exclamationThick),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "COVID 19 Travel Alerts",
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "2 hours ago",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildBackgroundAndTopBar(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Color(0xFF174f44),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Row(
              children: [
                Icon(MdiIcons.sortVariant),
                Spacer(),
                Icon(Icons.notifications),
              ],
            ),
            SizedBox(height: 0.075 * height),
            Row(
              children: [
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 34,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1524492926121-4723520d78d9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
                    radius: 30,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ready for a new experience",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Christian?",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildItem(TripItem item) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: 0.5 * width,
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 0.5 * width,
                  height: double.infinity,
                  child: Image.network(
                    item.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(
                              "Top Rated",
                              style: whiteTextStyle.copyWith(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        item.name,
                        style: whiteTextStyle,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Text(
                          item.city,
                          style: whiteTextStyle.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
