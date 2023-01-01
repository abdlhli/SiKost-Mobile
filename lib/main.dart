import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:sikost/Screen/login.dart';
import 'Screen/OnBoarding.dart';

void main() async {
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
          color: const Color.fromARGB(255, 20, 136, 204),
        ),
      ),
      home: OnBoarding(),
    );
  }
}
