import 'package:Flutter30Days/pages/home_pages/chair_home_page.dart';
import 'package:Flutter30Days/pages/home_pages/home_page.dart';
import 'package:Flutter30Days/pages/navigator_page.dart';
import 'package:Flutter30Days/pages/progress_page.dart';
import 'package:Flutter30Days/pages/sliver_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: NavigatorPage(),
    );
  }
}
