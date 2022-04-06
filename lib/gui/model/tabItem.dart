import 'package:flutter/material.dart';

class TabItem {
  final String? title;
  final IconData? iconData;

  TabItem({this.iconData, this.title});
}

final List<TabItem> tabItems = [
  TabItem(
    title: "Code",
    iconData: Icons.code
  ),
  TabItem(
      title: "Costumes",
      iconData: Icons.brush_rounded
  ),
  TabItem(
      title: "Sounds",
      iconData: Icons.volume_up_rounded
  ),
];