import 'package:flutter/material.dart';

class BlockCategory {
  final String? category;
  final Color? color;

  BlockCategory({this.category, this.color});
}

final List<BlockCategory> blockCategories = [
  BlockCategory(
    category: "Motion",
    color: Colors.blue,
  ),
  BlockCategory(
    category: "Looks",
    color: Colors.deepPurple,
  ),
  BlockCategory(
    category: "Sound",
    color: Colors.purpleAccent,
  ),
  BlockCategory(
    category: "Events",
    color: Colors.yellow,
  ),
  BlockCategory(
    category: "Control",
    color: Colors.orange,
  ),
  BlockCategory(
    category: "Sensing",
    color: Colors.lightBlueAccent,
  ),
  BlockCategory(
    category: "Operators",
    color: Colors.green,
  ),
  BlockCategory(
    category: "Variables",
    color: Colors.deepOrange,
  ),
];