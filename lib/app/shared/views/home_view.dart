// ignore_for_file: sized_box_for_whitespace, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../utils/theme_selector.dart';
import '../utils/view_wrapper.dart';
import '../widgets/navigation_arrow.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ViewWrapper(desktopView: desktopView(), mobileView: mobileView());
  }

  Widget desktopView() {
    return Stack(
      children: [
        const NavigationArrow(isBackArrow: false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(getFontSize(true)),
                  SizedBox(height: screenHeight * 0.05),
                  subHeader('Computer Scientist.', getFontSize(false)),
                  SizedBox(height: screenHeight * 0.01),
                  subHeader('App Developer.', getFontSize(false)),
                  SizedBox(height: screenHeight * 0.01),
                  subHeader('Flutter Enthusiast.', getFontSize(false)),
                  SizedBox(height: screenHeight * 0.1),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            profilePicture()
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        profilePicture(),
        SizedBox(height: screenHeight * 0.02),
        header(30),
        SizedBox(height: screenHeight * 0.01),
        subHeader('Computer Scientist - App Developer - Flutter Enthusiast', 15)
      ],
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 400;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 350;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 300;
    } else {
      return 250;
    }
  }

  double getFontSize(bool isHeader) {
    double fontSize = screenWidth > 950 && screenHeight > 550 ? 30 : 25;
    return isHeader ? fontSize * 2.25 : fontSize;
  }

  Widget profilePicture() {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(
          '/teste',
        );
      },
      child: Container(
        height: getImageSize(),
        width: getImageSize(),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(getImageSize() / 2),
            // child: Image.asset(
            //   'assets/picture.png',
            //   fit: BoxFit.cover,
            // ),
            child: Text('teste')),
      ),
    );
  }

  Widget header(double fontSize) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: ThemeSelector.selectHeadline(context),
        children: const <TextSpan>[
          TextSpan(text: 'Hi, my name is '),
          TextSpan(text: 'Florian', style: TextStyle(color: Color(0xff21a179))),
          TextSpan(text: '!'),
        ],
      ),
    );
  }

  Widget subHeader(String text, double fontSize) {
    return Text(text, style: ThemeSelector.selectSubHeadline(context));
  }
}
