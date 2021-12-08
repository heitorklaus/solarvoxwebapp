import 'package:flutter/material.dart';
import 'package:solarvox/app/shared/utils/theme_selector.dart';

late double screenWidth;
late double screenHeight;

double getFontSize(bool isHeader) {
  double fontSize = screenWidth > 950 && screenHeight > 550 ? 30 : 25;
  return isHeader ? fontSize * 2.25 : fontSize;
}

Widget subHeader(String text, double fontSize, context) {
  return Text(text, style: ThemeSelector.selectSubHeadline(context));
}

Widget header(String text, double fontSize, context) {
  return Text(text, style: ThemeSelector.selectTitulos(context));
}

Widget profilePicture() {
  return Container(
    height: getImageSize(),
    width: getImageSize(),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(getImageSize() / 2),
        child: Container(
          color: Colors.grey,
          child: const Center(child: Text('PLACEHOLDER IMAGE')),
        )),
  );
}

double getImageSize() {
  if (screenWidth > 1600 && screenHeight > 800) {
    return 350;
  } else if (screenWidth > 1300 && screenHeight > 600) {
    return 300;
  } else if (screenWidth > 1000 && screenHeight > 400) {
    return 200;
  } else {
    return 150;
  }
}
