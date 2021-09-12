import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_demo/person.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Person person = new Person(firstName: "Mabrur", lastName: "Satori");
  Map<String, dynamic> jsonText =
      new Person(firstName: "Mabrur", lastName: "Satori").toJson();
  String jsonString;

  MyApp() {
    jsonString = jsonEncode(person);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
