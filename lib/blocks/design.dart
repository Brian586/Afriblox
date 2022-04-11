import 'dart:ui' as ui;
import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  double? extensionLength;

  RPSCustomPainter({this.extensionLength});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.07030385);
    path_0.cubicTo(0, size.height * 0.03147506, size.width * 0.01145833, 0,
        size.width * 0.02559375, 0);
    path_0.lineTo(size.width * 0.09177083, 0);
    path_0.cubicTo(
        size.width * 0.09856250,
        0,
        size.width * 0.1050729,
        size.height * 0.007410947,
        size.width * 0.1098750,
        size.height * 0.02060186);
    path_0.lineTo(size.width * 0.1460625, size.height * 0.1200058);
    path_0.cubicTo(
        size.width * 0.1508646,
        size.height * 0.1331967,
        size.width * 0.1573750,
        size.height * 0.1406077,
        size.width * 0.1641667,
        size.height * 0.1406077);
    path_0.lineTo(size.width * 0.2453333, size.height * 0.1406077);
    path_0.cubicTo(
        size.width * 0.2521250,
        size.height * 0.1406077,
        size.width * 0.2586354,
        size.height * 0.1331967,
        size.width * 0.2634375,
        size.height * 0.1200058);
    path_0.lineTo(size.width * 0.2996250, size.height * 0.02060186);
    path_0.cubicTo(size.width * 0.3044271, size.height * 0.007410947,
        size.width * 0.3109375, 0, size.width * 0.3177292, 0);
    path_0.lineTo(size.width * 0.9725417, 0);
    path_0.cubicTo(
        size.width * 0.9866771,
        0,
        size.width * 0.9981354,
        size.height * 0.03147506,
        size.width * 0.9981354,
        size.height * 0.07030385);
    path_0.lineTo(size.width * 0.9981354, size.height * 0.7733423);
    path_0.cubicTo(
        size.width * 0.9981354,
        size.height * 0.8121711,
        size.width * 0.9866771,
        size.height * 0.8436462,
        size.width * 0.9725417,
        size.height * 0.8436462);
    path_0.lineTo(size.width * 0.3177292, size.height * 0.8436462);
    path_0.cubicTo(
        size.width * 0.3109375,
        size.height * 0.8436462,
        size.width * 0.3044271,
        size.height * 0.8510571,
        size.width * 0.2996250,
        size.height * 0.8642480);
    path_0.lineTo(size.width * 0.2634375, size.height * 0.9636520);
    path_0.cubicTo(
        size.width * 0.2586354,
        size.height * 0.9768429,
        size.width * 0.2521250,
        size.height * 0.9842538,
        size.width * 0.2453333,
        size.height * 0.9842538);
    path_0.lineTo(size.width * 0.1641667, size.height * 0.9842538);
    path_0.cubicTo(
        size.width * 0.1573750,
        size.height * 0.9842538,
        size.width * 0.1508646,
        size.height * 0.9768429,
        size.width * 0.1460625,
        size.height * 0.9636520);
    path_0.lineTo(size.width * 0.1098750, size.height * 0.8642480);
    path_0.cubicTo(
        size.width * 0.1050729,
        size.height * 0.8510571,
        size.width * 0.09856250,
        size.height * 0.8436462,
        size.width * 0.09177083,
        size.height * 0.8436462);
    path_0.lineTo(size.width * 0.02559375, size.height * 0.8436462);
    path_0.cubicTo(size.width * 0.01145833, size.height * 0.8436462, 0,
        size.height * 0.8121711, 0, size.height * 0.7733423);
    path_0.lineTo(0, size.height * 0.07030385);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = ui.Color.fromARGB(255, 71, 196, 40).withOpacity(0.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.005208333, size.height * 0.07030385);
    path_1.lineTo(size.width * 0.005208333, size.height * 0.7733423);
    path_1.cubicTo(
        size.width * 0.005208333,
        size.height * 0.8042860,
        size.width * 0.01433654,
        size.height * 0.8293604,
        size.width * 0.02559375,
        size.height * 0.8293604);
    path_1.lineTo(size.width * 0.09177083, size.height * 0.8293604);
    path_1.cubicTo(
        size.width * 0.09994485,
        size.height * 0.8293604,
        size.width * 0.1077813,
        size.height * 0.8382788,
        size.width * 0.1135606,
        size.height * 0.8541540);
    path_1.lineTo(size.width * 0.1497481, size.height * 0.9535579);
    path_1.cubicTo(
        size.width * 0.1535740,
        size.height * 0.9640675,
        size.width * 0.1587589,
        size.height * 0.9699681,
        size.width * 0.1641667,
        size.height * 0.9699681);
    path_1.lineTo(size.width * 0.2453333, size.height * 0.9699681);
    path_1.cubicTo(
        size.width * 0.2507411,
        size.height * 0.9699681,
        size.width * 0.2559260,
        size.height * 0.9640675,
        size.width * 0.2597519,
        size.height * 0.9535579);
    path_1.lineTo(size.width * 0.2959394, size.height * 0.8541540);
    path_1.cubicTo(
        size.width * 0.3017187,
        size.height * 0.8382788,
        size.width * 0.3095552,
        size.height * 0.8293604,
        size.width * 0.3177292,
        size.height * 0.8293604);
    path_1.lineTo(
        size.width * 0.9725417 + extensionLength!,
        size.height *
            0.8293604); //size.width * 0.9725417, size.height * 0.8293604);
    path_1.cubicTo(
        size.width * 0.9837989 + extensionLength!, //size.width * 0.9837989,
        size.height * 0.8293604,
        size.width * 0.9929271 + extensionLength!,
        size.height * 0.8042860,
        size.width * 0.9929271 + extensionLength!,
        size.height * 0.7733423);
    path_1.lineTo(
        size.width * 0.9929271 + extensionLength!, size.height * 0.07030385);
    path_1.cubicTo(
        size.width * 0.9929271 + extensionLength!,
        size.height * 0.03936012,
        size.width * 0.9837989 + extensionLength!,
        size.height * 0.01428571,
        size.width * 0.9725417 + extensionLength!,
        size.height * 0.01428571);
    path_1.lineTo(size.width * 0.3177292, size.height * 0.01428571);
    path_1.cubicTo(
        size.width * 0.3123214,
        size.height * 0.01428571,
        size.width * 0.3071365,
        size.height * 0.02018636,
        size.width * 0.3033106,
        size.height * 0.03069592);
    path_1.lineTo(size.width * 0.2671231, size.height * 0.1300999);
    path_1.cubicTo(
        size.width * 0.2613438,
        size.height * 0.1459751,
        size.width * 0.2535073,
        size.height * 0.1548934,
        size.width * 0.2453333,
        size.height * 0.1548934);
    path_1.lineTo(size.width * 0.1641667, size.height * 0.1548934);
    path_1.cubicTo(
        size.width * 0.1559927,
        size.height * 0.1548934,
        size.width * 0.1481562,
        size.height * 0.1459751,
        size.width * 0.1423769,
        size.height * 0.1300999);
    path_1.lineTo(size.width * 0.1061894, size.height * 0.03069592);
    path_1.cubicTo(
        size.width * 0.1023635,
        size.height * 0.02018636,
        size.width * 0.09717864,
        size.height * 0.01428571,
        size.width * 0.09177083,
        size.height * 0.01428571);
    path_1.lineTo(size.width * 0.02559375, size.height * 0.01428571);
    path_1.cubicTo(
        size.width * 0.01433654,
        size.height * 0.01428571,
        size.width * 0.005208333,
        size.height * 0.03936012,
        size.width * 0.005208333,
        size.height * 0.07030385);
    path_1.close();

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01041667;
    paint_1_stroke.color = Colors.blue.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.blue.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
