// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/custom_icon_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Container(
              height: 2,
              width: screenWidth * 0.9,
              color: Colors.black,
            )),
        Container(
          height: screenHeight * 0.05,
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CustomIconButton(
                      iconData: FontAwesomeIcons.youtube,
                      url:
                          'https://www.youtube.com/channel/UCcrXelEbe1HEZb0Olqy7jGg',
                      color: Colors.red,
                    ),
                    SizedBox(width: screenWidth * 0.021),
                    const CustomIconButton(
                      iconData: FontAwesomeIcons.github,
                      url: 'https://github.com/FlorianPruemer',
                      color: Colors.black,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    const CustomIconButton(
                      iconData: FontAwesomeIcons.linkedin,
                      url: 'https://www.linkedin.com/in/FlorianPruemer/',
                      color: Colors.blue,
                    )
                  ],
                ),
                const Text('SolarVox Plataforma  \u00a9 2021',
                    style: TextStyle(color: Colors.black, fontFamily: 'Barlow'))
              ],
            ),
          ),
        )
      ],
    );
  }
}
