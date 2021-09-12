import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double width = 200;
  double height = 100;
  int increment = 1;
  Timer _timer;
  _MyAppState() {
    _timer = Timer.periodic(new Duration(milliseconds: 100), (timer) {
      setState(() {
        if (width == 200) {
          width = 300;
          height = 200;
        } else {
          width = 200;
          height = 100;
        }
        increment += 1;
        if (increment == 60) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              _timer.cancel();
            },
            child: AnimatedContainer(
              color: Colors.red,
              width: width,
              height: height,
              duration: Duration(seconds: 1),
              child: Text(increment.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
