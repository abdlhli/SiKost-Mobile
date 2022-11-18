// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:sikost/Screen/Booking/JenisKamar.dart';
import 'package:sikost/Screen/login.dart';
import 'package:sikost/Widget/BottomBar.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(-0.38202300667762756, 1.6289153099060059),
              end: Alignment(-1.6289153099060059, -1.6625103950500488),
              colors: [
                Color.fromRGBO(43, 50, 178, 1),
                Color.fromRGBO(20, 136, 204, 1),
              ]),
        ),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      height: 1),
                )),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                width: 271,
                height: 271,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/avatarhi.png'),
                      fit: BoxFit.fitWidth),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                "Kost Putri Jawa - 48",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 40),
              child: Text(
                "Dapatkan tempat untuk beristirahat yang nyaman dan booking dimanapun dan kapanpun saat tersedia",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 230,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(80, 0, 0, 0),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 5),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 20, 141, 233),
                    Color.fromARGB(255, 96, 84, 227),
                  ],
                ),
              ),
              child: TextButton(
                child: Text(
                  'Booking Kamar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => JenisKamar()));
                },
              ),
            ),
            Container(
              width: 230,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(80, 0, 0, 0),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 5),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: TextButton(
                child: Text(
                  'Login Akun',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => loginPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
