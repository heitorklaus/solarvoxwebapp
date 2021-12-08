import 'package:flutter/material.dart';
import '../widgets/custom_tab.dart';

class ContentView {
  ContentView({required this.tab, required this.content, required this.link});

  final CustomTab tab;
  final Widget content;
  final String link;
}
