import 'package:flutter/material.dart';
import 'pages/exports.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch (settings.name) {
      case NavigatorPage.route:
        return MaterialPageRoute(builder: (context) => NavigatorPage());
      case SearchPage.route:
        return MaterialPageRoute(builder: (context) => SearchPage());
      case AuthPage.route:
        return MaterialPageRoute(builder: (context) => AuthPage());
      case StepperPage.route:
        return MaterialPageRoute(builder: (context) => StepperPage());
      case SliverPage.route:
        return MaterialPageRoute(builder: (context) => SliverPage());
      case ProgressPage.route:
        return MaterialPageRoute(builder: (context) => ProgressPage());
      case LoginPage.route:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case CategoryPage.route:
        return MaterialPageRoute(builder: (context) => CategoryPage());
      case AdventurePage.route:
        return MaterialPageRoute(builder: (context) => AdventurePage());
      case ChairHomePage.route:
        return MaterialPageRoute(builder: (context) => ChairHomePage());
      case ExplorePage.route:
        return MaterialPageRoute(builder: (context) => ExplorePage());
      case SignUpPage.route:
        return MaterialPageRoute(builder: (context) => SignUpPage());
      case HomePage.route:
        return MaterialPageRoute(builder: (context) => HomePage());
      case TicketPage.route:
        return MaterialPageRoute(builder: (context) => TicketPage());
      case SushiHomePage.route:
        return MaterialPageRoute(builder: (context) => SushiHomePage());
      case FurniturePage.route:
        return MaterialPageRoute(builder: (context) => FurniturePage());
      case FurnitureDetailPage.route:
        return MaterialPageRoute(builder: (context) => FurnitureDetailPage());
      case SettingsPage.route:
        return MaterialPageRoute(builder: (context) => SettingsPage());
      case TripPage.route:
        return MaterialPageRoute(builder: (context) => TripPage());
      case MotivationPage.route:
        return MaterialPageRoute(builder: (context) => MotivationPage());
      case HydrationPage.route:
        return MaterialPageRoute(builder: (context) => HydrationPage());
      case PropertyPage.route:
        return MaterialPageRoute(builder: (context) => PropertyPage());
      case PlantPage.route:
        return MaterialPageRoute(builder: (context) => PlantPage());
      default:
        return MaterialPageRoute(builder: (context) => NavigatorPage());
    }
  }
}
