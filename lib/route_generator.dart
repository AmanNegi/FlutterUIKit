import 'package:Flutter30Days/pages/adventure_page.dart';
import 'package:Flutter30Days/pages/ticket_page.dart';
import 'package:Flutter30Days/pages/category_page.dart';
import 'package:Flutter30Days/pages/progress_page.dart';
import 'package:Flutter30Days/pages/sliver_page.dart';
import 'package:Flutter30Days/pages/stepper_page.dart';
import 'package:flutter/material.dart';
import "pages/navigator_page.dart";
import 'pages/search_page.dart';
import 'pages/auth/auth_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/auth/signup_page.dart';
import 'pages/home_page.dart';
import 'pages/explore_page.dart';
import 'pages/chair_home_page.dart';

//! RouteGenerator : All routes used throughout the app

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
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
      default:
        return MaterialPageRoute(builder: (context) => NavigatorPage());
    }
  }
}
