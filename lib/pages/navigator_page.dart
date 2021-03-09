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
import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Navigator Page",
          style: TextStyle(color: Colors.indigo),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: width),
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
            Padding(
              padding: const EdgeInsets.all(15.0),
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

    // return RaisedButton(
    //   onPressed: () {
    //     Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => destination,
    //     ));
    //   },
    //   child: Text(text),
    // );
  }
}
