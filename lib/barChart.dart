import 'package:charthub/Methods/extended_methods.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final double size;
  final List<double> items;
  final Color? color;
  final double? fontSize;
  final bool? showValues;
  final FontWeight? fontWeight;

  BarChart(
      {required this.size,
      required this.items,
      this.color,
      this.fontSize,
      this.showValues,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(size, size), // Width and height of the canvas
        painter: GraphBorderPainter(
            items: items,
            color: color,
            showValues: showValues,
            fontSize: fontSize,
            fontWeight: fontWeight),
      ),
    );
  }
}

class GraphBorderPainter extends CustomPainter {
  final ExtendedMethods extendedMethods = ExtendedMethods();
  final List<double> items;
  final Color? color;
  final double? fontSize;
  final bool? showValues;
  final FontWeight? fontWeight;

  GraphBorderPainter(
      {required this.items,
      this.color,
      this.showValues,
      this.fontSize,
      this.fontWeight});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    var startPoint = Offset(0, size.height);
    var endPoint = Offset(size.width, size.height);

    //for horizontal line x axis
    canvas.drawLine(startPoint, endPoint, paint);

    startPoint = Offset(0, 0);
    endPoint = Offset(0, size.width);

    double maxNumber =
        items.reduce((value, element) => value > element ? value : element);
    //Drawing vertical line
    canvas.drawLine(startPoint, endPoint, paint);

    for (int i = 1; i <= items.length; i++) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: '${items[i - 1]}',
          style: TextStyle(
              color: Colors.black,
              fontSize: fontSize ?? 10,
              fontWeight: fontWeight ?? FontWeight.normal),
        ),
        textDirection: TextDirection.ltr,
      );
      paint.color = color ?? extendedMethods.getRandomDarkColor(i - 1);
      double itemHeight =
          size.height - ((size.height) / maxNumber) * items[i - 1];

      double points =
          ((size.height - ((size.height / items.length) / items.length)) /
              items.length);

      if (showValues ?? true) {
        textPainter.layout(minWidth: 0, maxWidth: size.width);
        textPainter.paint(
            canvas,
            Offset(
                (points * (i - 1)) + (points / items.length), itemHeight - 15));
      }

      final rect = Rect.fromPoints(
          Offset(
              (points * i - 1) - points + (points / items.length), itemHeight),
          Offset((points * i), size.height));

      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
