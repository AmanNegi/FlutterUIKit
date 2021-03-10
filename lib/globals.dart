import 'package:flutter/material.dart';


ValueNotifier<Size> screenSize = new ValueNotifier(Size(0, 0));

bool isFullScreen(Size currentSize) {
  print("$screenSize == $currentSize");

  if (screenSize.value.height == currentSize.height &&
      screenSize.value.width == currentSize.width)
    return true;
  else
    return false;
}
