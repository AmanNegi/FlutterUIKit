import 'package:flutter_30_days/bottomSheet/normal_bottom_sheet.dart';
import 'package:flutter_30_days/dialogs/plain_dialog.dart';
import 'package:flutter_30_days/dialogs/popup_dialog.dart';
import 'package:flutter_30_days/helper/hex_code.dart';
import 'package:flutter_30_days/painters/book_painter.dart';
import "package:flutter/material.dart";
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../layout/back_layout.dart';

class ChairHomePage extends StatefulWidget {
  static const String route = "/ChairHomePage";
  @override
  _ChairHomePageState createState() => _ChairHomePageState();
}

class _ChairHomePageState extends State<ChairHomePage> {
  List<Chair> listOfItems = [
    Chair(
        image: "assets/chair1.png",
        price: "1,512",
        title: "Wingback Chair",
        subTitle: "Medulus Sadi Arena"),
    Chair(
        image: "assets/chair2.png",
        price: "1,895",
        title: "Nanlville ArmChair",
        subTitle: "Concent with comfort"),
  ];
  var height, width;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      return Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        body: _buildBody(context),
      );
    });
  }

  _buildBody(BuildContext context) {
    return CustomPaint(
      painter: BookPainter(),
      child: Container(
        height: height,
        width: width,
        child: BackLayout(
          size: Size(width, height),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 54,
                ),
                Container(
                  height: 0.325 * height,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 40.0, right: 40.0, bottom: 40.0, top: 20.0),
                    child: Center(
                      child: Image.asset(
                        "assets/birds.png",
                        alignment: Alignment.centerRight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          spreadRadius: 10.0,
                          color: Colors.black.withOpacity(0.05),
                        ),
                      ],
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "BEST SELLING",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  height: 0.4 * height,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItem(
                          index % 2 == 0 ? listOfItems[0] : listOfItems[1]);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "TRENDING",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  height: 0.435 * height,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItem(
                          index % 2 == 0 ? listOfItems[1] : listOfItems[0]);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildItem(Chair item) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 0.5 * width,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                width: 0.5 * width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10.0,
                        spreadRadius: 10.0),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 0.2 * height,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(item.image),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            item.subTitle,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "₹ " + item.price,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: HexColor("#005dff"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: HexColor("#005dff"),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  MdiIcons.bookmarkOutline,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          MdiIcons.sortVariant,
          color: Colors.black,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => PlainDialog(),
          );
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            MdiIcons.textBox,
            color: Colors.black,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "You clicked on a icon!",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
                ),
              ),
              duration: Duration(seconds: 25),
              elevation: 30,
              backgroundColor: Theme.of(context).canvasColor,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              action: SnackBarAction(
                label: "Ok",
                textColor: HexColor("#005dff"),
                onPressed: () {},
              ),
            ));
          },
        ),
        IconButton(
          icon: Icon(
            MdiIcons.paperCutVertical,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.showBottomSheet(
              (context) => NormalBottomSheet(),
              backgroundColor: Colors.transparent,
            );
          },
        ),
        IconButton(
          icon: Icon(
            MdiIcons.searchWeb,
            color: Colors.black,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => PopupDialog(),
            );
          },
        ),
      ],
    );
  }
}

class Chair {
  String image;
  String title;
  String subTitle;
  String price;

  Chair({
    required this.image,
    required this.price,
    required this.subTitle,
    required this.title,
  });
}
