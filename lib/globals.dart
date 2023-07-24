import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


const String APP_NAME = "FlutterUIKit";

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
