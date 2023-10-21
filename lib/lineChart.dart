import 'package:charthub/Methods/extended_methods.dart';
import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  final double size;
  final List<double> items;
  final Color? color;
  final bool? showValues;
  final TextStyle? textStyle;

  LineChart(
      {required this.size,
      required this.items,
      this.color,
      this.showValues,
      this.textStyle});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(size, size), // Width and height of the canvas
        painter: GraphBorderPainter(
            items: items,
            color: color,
            showValues: showValues,
            textStyle: textStyle),
      ),
    );
  }
}

class GraphBorderPainter extends CustomPainter {
  final ExtendedMethods extendedMethods = ExtendedMethods();
  final List<double> items;
  final Color? color;
  final bool? showValues;
  final TextStyle? textStyle;

  GraphBorderPainter(
      {required this.items, this.color, this.showValues, this.textStyle});

  List<double> lastLinePoints = [];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    var startPoint = Offset(0, size.height);
    var endPoint = Offset(size.width, size.height);
    lastLinePoints = [0, size.height];

    //for horizontal line x axis
    canvas.drawLine(startPoint, endPoint, paint);

    startPoint = Offset(0, 0);
    endPoint = Offset(0, size.width);

    double maxNumber =
        items.reduce((value, element) => value > element ? value : element);
    //Drawing vertical line
    canvas.drawLine(startPoint, endPoint, paint);

    for (int i = 1; i <= items.length; i++) {
      Color clr = color ?? extendedMethods.getRandomDarkColor(i - 1);
      paint.color = clr;
      final textPainter = TextPainter(
        text: TextSpan(
          text: '${items[i - 1]}',
          style: textStyle ??
              TextStyle(
                  color: clr, fontSize: 10, fontWeight: FontWeight.normal),
        ),
        textDirection: TextDirection.ltr,
      );

      double itemHeight =
          size.height - ((size.height) / maxNumber) * items[i - 1];

      double points =
          ((size.height - ((size.height / items.length) / items.length)) /
              items.length);

      if (showValues ?? true) {
        textPainter.layout(minWidth: 0, maxWidth: size.width);
        textPainter.paint(
            canvas, Offset((points * i) - points / 2, size.height + 8));
      }
      final center = Offset((points * i) - points / 2, itemHeight);
      final radius = 7.0;

      canvas.drawLine(Offset(lastLinePoints[0], lastLinePoints[1]),
          Offset((points * i) - points / 2, itemHeight), paint);
      lastLinePoints = [(points * i) - points / 2, itemHeight];

      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
