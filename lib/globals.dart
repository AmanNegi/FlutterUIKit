import 'package:flutter/material.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import "pages/exports.dart";

import 'package:shared_preferences/shared_preferences.dart';

const String APP_NAME = "Flutter 30 days";

SharedPreferences? sharedPreferences;
bool firstTime = true;

initSharedPrefs() async {
  if (sharedPreferences == null)
    sharedPreferences = await SharedPreferences.getInstance();
}

isFirstTime() async {
  await initSharedPrefs();
  if (sharedPreferences!.containsKey("firstTime")) {
    print("isFirstTime: false");
    firstTime = false;
  } else {
    print("isFirstTime: true");
    sharedPreferences!.setBool("firstTime", false);
    firstTime = true;
  }
}

bool isFullScreen(Size currentSize, Size fullSize) {
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

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
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
  late double height, width;
  late double buttonWidth;
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
          tapTarget: Icon(MdiIcons.chevronDoubleLeft),
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
                MdiIcons.chevronDoubleLeft,
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
  String route;

  ButtonItem(this.text, this.route);
}

List<ButtonItem> buttonList = [
  ButtonItem("Auth Page", AuthPage.route),
  ButtonItem("Login Page", LoginPage.route),
  ButtonItem("Sign Up Page", SignUpPage.route),
  ButtonItem("Home Page", HomePage.route),
  ButtonItem("Chair Home Page", ChairHomePage.route),
  ButtonItem("Sliver Page", SliverPage.route),
  ButtonItem("Category Page", CategoryPage.route),
  ButtonItem("Search Page", SearchPage.route),
  ButtonItem("Progress Page", ProgressPage.route),
  ButtonItem("Explore Books Page", ExplorePage.route),
  ButtonItem("Adventure Page", AdventurePage.route),
  ButtonItem("Stepper Page", StepperPage.route),
  ButtonItem("Plant Page", PlantPage.route),
  ButtonItem("Ticket Page", TicketPage.route),
  ButtonItem("Sushi Page", SushiHomePage.route),
  ButtonItem("Furniture Page", FurniturePage.route),
  ButtonItem("Furniture Detail Page", FurnitureDetailPage.route),
  ButtonItem("Settings Page", SettingsPage.route),
  ButtonItem("Trip Page", TripPage.route),
  ButtonItem("Motivation Page", MotivationPage.route),
  ButtonItem("Hydration Page", HydrationPage.route),
  ButtonItem("Property Page", PropertyPage.route),
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
