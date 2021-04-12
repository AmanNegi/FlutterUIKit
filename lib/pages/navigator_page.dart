import 'package:flutter/material.dart';

import 'dart:async';
import '../helper/hex_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdi/mdi.dart';
import '../layout/side_drawer.dart';
import 'package:flutter_30_days/globals.dart';
import 'package:feature_discovery/feature_discovery.dart';

class NavigatorPage extends StatefulWidget {
  static const String route = "/NavigatorPage";

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  var height, width;
  bool showList = false;
  PageController pageController;
  int currentPage = 0;
  ValueNotifier<bool> isFadedAway = ValueNotifier(false);
  bool allowChangingValue = true;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    pageController = new PageController(
        viewportFraction: 0.985, initialPage: 0, keepPage: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FeatureDiscovery.discoverFeatures(
          context, <String>['pageView', 'left', "up", "down", "right"]);
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColor: HexColor("#39b6fa").withOpacity(0.1),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        drawer: SideDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            DescribedFeatureOverlay(
              barrierDismissible: false,
              featureId: "pageView",
              title: Text("Change Viewing mode using this button"),
              tapTarget: Icon(Mdi.viewDayOutline),
              child: IconButton(
                  tooltip: "Change viewing mode",
                  icon: Icon(
                    !showList ? Mdi.viewDayOutline : Mdi.viewCarouselOutline,
                    color: Colors.indigo,
                  ),
                  onPressed: () {
                    showList = !showList;
                    setState(() {});
                  }),
            )
          ],
          leading: IconButton(
            icon: Icon(
              Mdi.sortVariant,
              color: Colors.indigo,
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Index Page",
            style: TextStyle(color: Colors.indigo),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: showList ? _buildBody() : _buildPageView(),
      ),
    );
  }

  _buildPageView() {
    return Stack(
      children: [
        PageView.builder(
          allowImplicitScrolling: false,
          pageSnapping: true,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (int page) {
            currentPage = page;
            setState(() {});
          },
          itemCount: pageList.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: pageController,
              builder: (BuildContext context, Widget child) {
                double value = 1.0;
                if (pageController.position.haveDimensions) {
                  value = pageController.page - index;
                  value = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
                }

                return Center(
                  child: Container(
                    height: Curves.easeOut.transform(value) * height,
                    width: Curves.easeOut.transform(value) * width,
                    child: child,
                  ),
                );
              },
              child: _buildPageItem(pageList[index].page),
            );
          },
          scrollDirection: Axis.horizontal,
        ),
        _buildNavigator(),
      ],
    );
  }

  _buildNavigator() {
    return Positioned(
      bottom: 60,
      left: 0.2 * width,
      right: 0.2 * width,
      child: Hero(
        tag: "herotagfor1",
        child: GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details) async {
            if (details.delta.dy < 0) {
              Navigator.of(context).pushNamed(pageList[currentPage].routeName);
            } else if (details.delta.dy > 0) {
              if (allowChangingValue) {
                isFadedAway.value = !isFadedAway.value;
                allowChangingValue = false;
              }
              Timer(Duration(seconds: 1), () {
                allowChangingValue = true;
              });
            }
          },
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            print(details.delta);
            if (details.delta.dx < 0) {
              print("-X Direction");
              pageController.nextPage(
                  duration: Duration(milliseconds: 250), curve: Curves.easeIn);
            } else if (details.delta.dx > 0) {
              print("+X Direction");
              pageController.previousPage(
                  duration: Duration(milliseconds: 250), curve: Curves.easeIn);
            }
          },
          child: ValueListenableBuilder(
            valueListenable: isFadedAway,
            builder: (BuildContext context, bool value, Widget child) {
              return Container(
                height: 0.08 * height,
                decoration: BoxDecoration(
                  color: value ? Colors.black.withOpacity(0.2) : Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: child,
              );
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DescribedFeatureOverlay(
                    barrierDismissible: false,
                    featureId: "left",
                    overflowMode: OverflowMode.wrapBackground,
                    contentLocation: ContentLocation.above,
                    title: Text("Swipe left to go to the previous page"),
                    tapTarget: Icon(Mdi.chevronDoubleLeft),
                    child: Icon(
                      Mdi.chevronDoubleLeft,
                      color: Colors.grey[700],
                      size: 30,
                    ),
                  ),
                  DescribedFeatureOverlay(
                    barrierDismissible: false,
                    featureId: "down",
                    overflowMode: OverflowMode.wrapBackground,
                    contentLocation: ContentLocation.above,
                    title: Text("Swipe down to reduce opacity"),
                    tapTarget: Icon(Mdi.chevronDoubleDown),
                    child: DescribedFeatureOverlay(
                      barrierDismissible: false,
                      featureId: "up",
                      overflowMode: OverflowMode.wrapBackground,
                      contentLocation: ContentLocation.above,
                      title: Text("Swipe up to open the current page"),
                      tapTarget: Icon(Mdi.chevronDoubleUp),
                      child: Icon(
                        Mdi.chevronDoubleUp,
                        color: Colors.grey[700],
                        size: 30,
                      ),
                    ),
                  ),
                  DescribedFeatureOverlay(
                    barrierDismissible: false,
                    featureId: "right",
                    overflowMode: OverflowMode.wrapBackground,
                    contentLocation: ContentLocation.above,
                    title: Text("Swipe right to go to the next page"),
                    tapTarget: Icon(Mdi.chevronDoubleRight),
                    child: Icon(
                      Mdi.chevronDoubleRight,
                      color: Colors.grey[700],
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildPageItem(Widget destination) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                  ),
                  child: destination),
            ),
          ),
        ],
      ),
    );
  }

  // _buildBody() {
  //   return GridView.builder(
  //       padding: EdgeInsets.all(10.0),
  //       itemCount: buttonList.length,
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 2,
  //           childAspectRatio: (0.4 * width) / (0.1 * height)),
  //       itemBuilder: (context, index) {
  //         return Container(
  //           margin: EdgeInsets.all(10.0),
  //           decoration: BoxDecoration(
  //             color: Colors.indigo,
  //             borderRadius: BorderRadius.circular(15.0)
  //           ),
  //           child: Center(
  //             child: Text(
  //               buttonList[index].text,
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //         );
  //       });
  // }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: width, height: 15),
          Column(
            children: List.generate(
                buttonList.length,
                (index) => _buildRaisedButton(
                    buttonList[index].text, buttonList[index].widget)),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "@ Aster Joules",
              style: TextStyle(
                letterSpacing: 1.1,
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildRaisedButton(String text, Widget destination) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => destination,
          ));
        },
        child: Container(
          height: 0.1 * height,
          width: 0.8 * width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.indigo,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
