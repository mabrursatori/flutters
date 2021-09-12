import 'package:flutter/material.dart';
import 'package:twk_game/ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Wrapper(),
      ),
    );
  }
}
