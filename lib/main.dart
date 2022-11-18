import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'Screen/OnBoarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(
          color: Color.fromARGB(255, 20, 136, 204),
        ),
      ),
      home: OnBoarding(),
    );
  }
}
