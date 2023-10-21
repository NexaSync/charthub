import 'package:flutter/material.dart';

class ExtendedMethods {
  //Random Color
  Color getRandomDarkColor(int index) {
    final List<Color> colorList = [
      Colors.red,
      Colors.green,
      Colors.pink,
      Colors.cyan,
      Colors.blueGrey,
      Colors.deepOrange,
      Colors.blue,
      Colors.purple,
      Colors.indigo
    ];

    final selectedColorIndex = index % colorList.length;
    return colorList[selectedColorIndex];
  }
}
