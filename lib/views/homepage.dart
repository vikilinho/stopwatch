import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stopwatch/views/stopwatch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(32.0),
          child: AspectRatio(aspectRatio: 0.7, child: Stopwatch()),
        )),
      ),
    );
  }
}
