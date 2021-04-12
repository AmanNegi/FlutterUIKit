import 'package:flutter_30_days/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/welcome_page.dart';
import 'package:feature_discovery/feature_discovery.dart';

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
    return FeatureDiscovery(
      recordStepsInSharedPreferences: false,
      // recordStepsInSharedPreferences: true,
      child: MaterialApp(
        theme: ThemeData(
          primaryIconTheme: IconThemeData(color: Colors.black),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
