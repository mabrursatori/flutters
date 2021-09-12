import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Drawer Demo"),
        ),
        drawer: Container(
          alignment: Alignment.topCenter,
          width: 200,
          height: 200,
          color: Colors.blue,
        
        ),
      ),
    );
  }
}
