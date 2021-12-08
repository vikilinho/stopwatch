import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondsTicker extends StatelessWidget {
  const ClockSecondsTicker(
      {Key? key, required this.seconds, required this.radius})
      : super(key: key);
  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    const width = 2.0;
    const height = 12.0;
    return Transform(
        transform: Matrix4.identity()
          ..translate(-width / 2, -height / 2, 0.0)
          ..rotateZ(2 * pi * (seconds / 60.0))
          ..translate(0.0, radius - height / 2, 0.0),
        alignment: Alignment.center,
        child: Container(color: color, width: width, height: height));
  }
}

class ClockTextMarker extends StatelessWidget {
  final int value;
  final int maxValue;
  final double radius;

  const ClockTextMarker(
      {Key? key,
      required this.value,
      required this.maxValue,
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double height = 30;
    const double width = 40;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-height / 2, -width / 2, 0.0) //center the text
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - 35, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          value.toString(),
          style: TextStyle(fontSize: 24.0, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
