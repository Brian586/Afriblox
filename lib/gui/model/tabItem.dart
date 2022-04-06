import 'package:flutter/material.dart';

class TabItem {
  final String? title;
  final String? icon;

  TabItem({this.icon, this.title});
}

final List<TabItem> tabItems = [
  TabItem(
    title: "Code",
    icon: "assets/icons/code.svg"
  ),
  TabItem(
      title: "Costumes",
      icon: "assets/icons/costume.svg"
  ),
  TabItem(
      title: "Sounds",
      icon: "assets/icons/sounds.svg"
  ),
];