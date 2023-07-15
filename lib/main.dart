import 'package:flutter_30_days/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/welcome_page.dart';
import 'pages/navigator/navigator_page.dart';
import 'globals.dart';
import 'package:feature_discovery/feature_discovery.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await isFirstTime();
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
      recordStepsInSharedPreferences: true,
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.green,
          primaryIconTheme: IconThemeData(color: Colors.black),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        home: !firstTime ? NavigatorPage() : WelcomePage(),
      ),
    );
  }
}
