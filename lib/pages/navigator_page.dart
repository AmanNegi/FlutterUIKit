import 'package:flutter/material.dart';

import 'dart:async';
import 'package:mdi/mdi.dart';

import 'hydration_page.dart';
import 'property_page.dart';
import 'settings_page.dart';
import 'trip_page.dart';
import 'package:Flutter30Days/welcome_page.dart';
import 'sushi_home_page.dart';
import 'auth/signup_page.dart';
import 'auth/login_page.dart';
import 'motivation_page.dart';
import 'category_page.dart';
import 'chair_home_page.dart';
import 'explore_page.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'auth/auth_page.dart';
import 'progress_page.dart';
import 'sliver_page.dart';
import 'stepper_page.dart';
import 'furniture_page.dart';
import 'adventure_page.dart';
import 'plant_page.dart';
import 'ticket_page.dart';

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

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              tooltip: "Change viewing mode",
              icon: Icon(
                !showList ? Mdi.viewDayOutline : Mdi.viewCarouselOutline,
                color: Colors.indigo,
              ),
              onPressed: () {
                showList = !showList;
                setState(() {});
              })
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
                  Icon(
                    Mdi.chevronDoubleLeft,
                    color: Colors.grey[700],
                    size: 30,
                  ),
                  Icon(
                    Mdi.chevronDoubleUp,
                    color: Colors.grey[700],
                    size: 30,
                  ),
                  Icon(
                    Mdi.chevronDoubleRight,
                    color: Colors.grey[700],
                    size: 30,
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

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: width, height: 15),
          _buildRaisedButton("Home Page", HomePage()),
          _buildRaisedButton("Chair Home Page", ChairHomePage()),
          _buildRaisedButton("Sliver Page", SliverPage()),
          _buildRaisedButton("Explore Books Page", ExplorePage()),
          _buildRaisedButton("Auth Page", AuthPage()),
          _buildRaisedButton("Sign Up Page", SignUpPage()),
          _buildRaisedButton("Category Page", CategoryPage()),
          _buildRaisedButton("Search Page", SearchPage()),
          _buildRaisedButton("Progress Page", ProgressPage()),
          _buildRaisedButton("Stepper Page", StepperPage()),
          _buildRaisedButton("Adventure Page", AdventurePage()),
          _buildRaisedButton("Clip Page", TicketPage()),
          _buildRaisedButton("Plant Page", PlantPage()),
          _buildRaisedButton("Sushi Home Page", SushiHomePage()),
          _buildRaisedButton("Furniture Page", FurniturePage()),
          _buildRaisedButton("Settings Page", SettingsPage()),
          _buildRaisedButton("Trip Page", TripPage()),
          _buildRaisedButton("Motivation Page", MotivationPage()),
          _buildRaisedButton("Hydration Page", HydrationPage()),
          _buildRaisedButton("Property Page", PropertyPage()),
          _buildRaisedButton("Welcome Page", WelcomePage()),
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

class PageItem {
  Widget page;
  String routeName;

  PageItem(this.page, this.routeName);
}

List<PageItem> pageList = [
  PageItem(AuthPage(), AuthPage.route),
  PageItem(LoginPage(), LoginPage.route),
  PageItem(HomePage(), HomePage.route),
  PageItem(ChairHomePage(), ChairHomePage.route),
  PageItem(SliverPage(), SliverPage.route),
  PageItem(CategoryPage(), CategoryPage.route),
  PageItem(SearchPage(), SearchPage.route),
  PageItem(ProgressPage(), ProgressPage.route),
  PageItem(ExplorePage(), ExplorePage.route),
  PageItem(AdventurePage(), AdventurePage.route),
  PageItem(StepperPage(), StepperPage.route),
  PageItem(TicketPage(), TicketPage.route),
  PageItem(PlantPage(), PlantPage.route),
  PageItem(SushiHomePage(), SushiHomePage.route),
  PageItem(FurniturePage(), FurniturePage.route),
];
