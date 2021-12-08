// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key, required this.title, required this.link})
      : super(key: key);

  final String title;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Text(this.title,
            style: const TextStyle(fontSize: 16, color: Colors.black)));
  }
}
