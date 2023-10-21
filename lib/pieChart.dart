import 'dart:math';

import 'package:charthub/Methods/extended_methods.dart';
import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  final double size;
  final List<double> items;
  final Color? color;
  final bool? showValues;
  final TextStyle? textStyle;

  PieChart(
      {required this.size,
      required this.items,
      this.color,
      this.showValues,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size), // Set the size of your pie chart
      painter: PieChartPainter(
          items: items,
          color: color,
          showValues: showValues,
          textStyle: textStyle),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final ExtendedMethods extendedMethods = ExtendedMethods();
  final List<double> items;
  final Color? color;
  final bool? showValues;
  final TextStyle? textStyle;

  PieChartPainter(
      {required this.items, this.color, this.showValues, this.textStyle});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width;

    //Getting max value from given list
    double maxNumber = items.reduce((value, element) => value + element);

    double lastLocation = 0;

    //Creating Pie Chart
    for (int i = 0; i < items.length; i++) {
      double segmentArea = (((pi * 2) / maxNumber) * items[i]);

      // Draw the blue segment (50%)
      paint.color = color ?? extendedMethods.getRandomDarkColor(i);
      double startAngleBlue = lastLocation; // Start at the bottom
      double sweepAngleBlue = segmentArea; // Half of the circle

      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        startAngleBlue,
        sweepAngleBlue,
        true,
        paint,
      );
      lastLocation = segmentArea + lastLocation;
    }

    lastLocation = 0;

    //Showing Values on Pie Chart
    if (showValues ?? true) {
      for (int i = 0; i < items.length; i++) {
        double segmentArea = (((pi * 2) / maxNumber) * items[i]);
        double sweepAngleBlue = segmentArea; // Half of the circle

        // Calculate position for the text label
        final labelX =
            centerX + radius * 0.8 * cos(lastLocation + sweepAngleBlue / 2);
        final labelY =
            centerY + radius * 0.8 * sin(lastLocation + sweepAngleBlue / 2);
        final label = '${items[i]}';
        final textPainter = TextPainter(
          text: TextSpan(
            text: label,
            style: textStyle ?? TextStyle(color: Colors.white),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(labelX, labelY));

        lastLocation = segmentArea + lastLocation;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
