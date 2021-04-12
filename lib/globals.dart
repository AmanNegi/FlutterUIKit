import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:feature_discovery/feature_discovery.dart';

import "pages/furniture_detail_page.dart";
import 'pages/hydration_page.dart';
import 'pages/property_page.dart';
import 'pages/settings_page.dart';
import 'pages/trip_page.dart';
import 'pages/sushi_home_page.dart';
import 'pages/auth/signup_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/motivation_page.dart';
import 'pages/category_page.dart';
import 'pages/chair_home_page.dart';
import 'pages/explore_page.dart';
import 'pages/home_page.dart';
import 'pages/search_page.dart';
import 'pages/auth/auth_page.dart';
import 'pages/progress_page.dart';
import 'pages/sliver_page.dart';
import 'pages/stepper_page.dart';
import 'pages/furniture_page.dart';
import 'pages/adventure_page.dart';
import 'pages/plant_page.dart';
import 'pages/ticket_page.dart';

const String APP_NAME = "Flutter 30 days";

bool isFullScreen(Size currentSize, Size fullSize) {
  print("$fullSize == $currentSize");

  if (currentSize.height == fullSize.height &&
      fullSize.width == currentSize.width)
    return true;
  else
    return false;
}

Size getSize(BuildContext context) {
  return Size(
      MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
}

getBackButton(Size size) {
  return PullableButton(size.width, size.height);
}

class PullableButton extends StatefulWidget {
  final double height, width;

  PullableButton(this.width, this.height);

  @override
  _PullableButtonState createState() => _PullableButtonState();
}

class _PullableButtonState extends State<PullableButton> {
  double height, width;
  double buttonWidth;
  Color _color = Colors.black;
  bool allowChangingValue = true;

  @override
  void initState() {
    height = widget.height;
    width = widget.width;
    buttonWidth = 0.175 * width;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FeatureDiscovery.discoverFeatures(context, <String>['back']);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.1 * height,
      right: 0,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) async {
          if (details.delta.dx < 0) {
            // print("-X local Position : " + details.localPosition.toString());
            buttonWidth = 0.3 * width;
            setState(() {});
            Navigator.pop(context);
          } else if (details.delta.dx > 0) {
            // print("+X local Position : " + details.localPosition.toString());
            buttonWidth = 0.175 * width;
            setState(() {});
          }

          if (details.delta.dy > 0) {
            // print("Dragginga in +Y direction");
          } else {
            //  print("Dragging in -Y direction");
          }
        },
        child: DescribedFeatureOverlay(
          barrierDismissible: false,
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
          overflowMode: OverflowMode.wrapBackground,
          contentLocation: ContentLocation.above,
          title: Text("Swipe left to go back"),
          featureId: "back",
          tapTarget: Icon(Mdi.chevronDoubleLeft),
          child: Hero(
            tag: "herotagfor1",
            child: AnimatedContainer(
              duration: Duration(milliseconds: 150),
              curve: Curves.bounceInOut,
              height: 0.08 * height,
              width: buttonWidth,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
              child: Icon(
                Mdi.chevronDoubleLeft,
                color: Colors.grey,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  alterColor() {
    if (_color == Colors.black)
      _color = Colors.black.withOpacity(0.3);
    else
      _color = Colors.black;
  }
}

class ButtonItem {
  String text;
  Widget widget;

  ButtonItem(this.text, this.widget);
}

List<ButtonItem> buttonList = [
  ButtonItem("Auth Page", AuthPage()),
  ButtonItem("Login Page", LoginPage()),
  ButtonItem("Sign Up Page", SignUpPage()),
  ButtonItem("Home Page", HomePage()),
  ButtonItem("Chair Home Page", ChairHomePage()),
  ButtonItem("Sliver Page", SliverPage()),
  ButtonItem("Category Page", CategoryPage()),
  ButtonItem("Search Page", SearchPage()),
  ButtonItem("Progress Page", ProgressPage()),
  ButtonItem("Explore Books Page", ExplorePage()),
  ButtonItem("Adventure Page", AdventurePage()),
  ButtonItem("Stepper Page", StepperPage()),
  ButtonItem("Plant Page", PlantPage()),
  ButtonItem("Ticket Page", TicketPage()),
  ButtonItem("Sushi Page", SushiHomePage()),
  ButtonItem("Furniture Page", FurniturePage()),
  ButtonItem("Furniture Detail Page", FurnitureDetailPage()),
  ButtonItem("Settings Page", SettingsPage()),
  ButtonItem("Trip Page", TripPage()),
  ButtonItem("Motivation Page", MotivationPage()),
  ButtonItem("Hydration Page", HydrationPage()),
  ButtonItem("Property Page", PropertyPage()),
];

class PageItem {
  Widget page;
  String routeName;

  PageItem(this.page, this.routeName);
}

List<PageItem> pageList = [
  PageItem(AuthPage(), AuthPage.route),
  PageItem(LoginPage(), LoginPage.route),
  PageItem(SignUpPage(), SignUpPage.route),
  PageItem(HomePage(), HomePage.route),
  PageItem(ChairHomePage(), ChairHomePage.route),
  PageItem(SliverPage(), SliverPage.route),
  PageItem(CategoryPage(), CategoryPage.route),
  PageItem(SearchPage(), SearchPage.route),
  PageItem(ProgressPage(), ProgressPage.route),
  PageItem(ExplorePage(), ExplorePage.route),
  PageItem(AdventurePage(), AdventurePage.route),
  PageItem(StepperPage(), StepperPage.route),
  PageItem(PlantPage(), PlantPage.route),
  PageItem(TicketPage(), TicketPage.route),
  PageItem(SushiHomePage(), SushiHomePage.route),
  PageItem(FurniturePage(), FurniturePage.route),
  PageItem(FurnitureDetailPage(), FurnitureDetailPage.route),
  PageItem(SettingsPage(), SettingsPage.route),
  PageItem(TripPage(), TripPage.route),
  PageItem(MotivationPage(), MotivationPage.route),
  PageItem(HydrationPage(), HydrationPage.route),
  PageItem(PropertyPage(), PropertyPage.route),
];
