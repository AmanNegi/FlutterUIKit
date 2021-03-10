import 'package:Flutter30Days/pages/auth_page.dart';
import 'package:Flutter30Days/pages/category_page.dart';
import 'package:Flutter30Days/pages/home_pages/chair_home_page.dart';
import 'package:Flutter30Days/pages/home_pages/explore_page.dart';
import 'package:Flutter30Days/pages/home_pages/home_page.dart';
import 'package:Flutter30Days/pages/home_pages/search_page.dart';
import 'package:Flutter30Days/pages/progress_page.dart';
import 'package:Flutter30Days/pages/signup_page.dart';
import 'package:Flutter30Days/pages/sliver_page.dart';
import 'package:Flutter30Days/pages/stepper_page.dart';
import 'package:Flutter30Days/pages/adventure_page.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import '../globals.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  var height, width;
  bool showList = false;
  PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = new PageController(
      viewportFraction: 0.9,
      initialPage: 0,
      keepPage: false,
    );

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
    screenSize.value = Size(width, height);
    print(screenSize.value);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                !showList ? Mdi.viewDayOutline : Mdi.viewCarouselOutline,
                color: Colors.indigo,
              ),
              onPressed: () {
                showList = !showList;
                setState(() {});
              })
        ],
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
    return PageView.builder(
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
              value = (1 - (value.abs() * 0.8)).clamp(0.0, 1.0);
            }

            return Center(
              child: SizedBox(
                height: Curves.easeOut.transform(value) * height,
                width: Curves.easeOut.transform(value) * width,
                child: child,
              ),
            );
          },
          child: _buildPageItem(pageList[index].page, pageList[index].color),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }

  _buildPageItem(Widget destination, Color matchingColor) {
    return Container(
      // margin: EdgeInsets.all(5.0),
      // width: 0.8 * width,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                right: 20.0,
              ),
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
          Positioned(
            top: 0,
            right: 0.1 * width,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => destination));
              },
              child: Container(
                height: 0.125 * width,
                width: 0.125 * width,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: matchingColor ?? Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white54,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 2.0),
                        spreadRadius: 5.0,
                      )
                    ]),
                child: Center(
                  child: Text(
                    "GO",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
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
  Color color;

  PageItem(this.page, this.color);
}

List<PageItem> pageList = [
  PageItem(AuthPage(), Colors.blue.shade500),
  PageItem(HomePage(), Colors.indigo),
  PageItem(ChairHomePage(), Colors.indigo),
  PageItem(SliverPage(), Colors.indigo),
  PageItem(CategoryPage(), Colors.indigo),
  PageItem(SearchPage(), Colors.indigo),
  PageItem(ProgressPage(), Colors.indigo),
  PageItem(ExplorePage(), Colors.indigo),
  PageItem(AdventurePage(), Colors.indigo),
  PageItem(StepperPage(), Colors.indigo),
];
