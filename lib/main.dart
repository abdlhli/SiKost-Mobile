import 'package:flutter/material.dart';
import 'package:sikost/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: loginPage(),
  ));
}
