import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {}

  List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Color color1 = Colors.red;
  Color color2 = Colors.blue;
  bool isAccepted = false;
  Color targetColor = Colors.grey;
  HomePage() {
    loadJsonData();
  }

  Future<String> loadJsonData() async {
    final directory = await getApplicationDocumentsDirectory();
    String path = directory.path;
    File file = new File('$path/counter.txt');
    // Read the file
    var contents = await file.readAsString();
    var test = file.writeAsString('Satori');
    // var jsonText = await rootBundle.loadString('json/questions.json');
    // data = json.decode(jsonText);
    // Question q = Question.fromJson(data[0]);
    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Draggable<Color>(
                data: color1,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: color1,
                    shape: StadiumBorder(),
                  ),
                ),
                feedback: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: Colors.black26,
                    shape: StadiumBorder(),
                  ),
                ),
                childWhenDragging: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: color1.withOpacity(0.5),
                    shape: StadiumBorder(),
                  ),
                ),
              ),
              Draggable<Color>(
                data: color2,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: color2,
                    shape: StadiumBorder(),
                  ),
                ),
                feedback: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: Colors.black26,
                    shape: StadiumBorder(),
                  ),
                ),
                childWhenDragging: SizedBox(
                  width: 50,
                  height: 50,
                  child: Material(
                    color: color2.withOpacity(0.5),
                    shape: StadiumBorder(),
                  ),
                ),
              )
            ],
          ),
          DragTarget<Color>(
              onWillAccept: (value) => true,
              onAccept: (value) {
                isAccepted = true;
                targetColor = value;
              },
              builder: (context, candidates, rejected) {
                return (isAccepted)
                    ? SizedBox(
                        width: 100,
                        height: 100,
                        child: Material(
                          color: targetColor,
                          shape: StadiumBorder(),
                        ))
                    : SizedBox(
                        width: 100,
                        height: 100,
                        child: Material(
                          color: Colors.black26,
                          shape: StadiumBorder(),
                        ));
              })
        ],
      ),
    );
  }
}
