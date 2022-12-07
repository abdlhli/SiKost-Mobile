import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sikost/Widget/bawah.dart';
import 'home.dart';
import 'dart:math' as math;

class Rules extends StatelessWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 100),
        child: Column(
          children: [
            AppBar(
              toolbarHeight: 100,
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => NavBawah()));
                },
                icon: const Icon(Icons.arrow_back_ios_new),
                color: Colors.blue.shade900,
              ),
              title: const Text(
                "Peratuan KOST",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                const Color.fromARGB(255, 20, 136, 204),
                const Color.fromARGB(255, 43, 50, 178),
              ],
            )),
          ),
          Transform.rotate(
            angle: -math.pi / 3.3,
            alignment: Alignment.topLeft,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: const Offset(4, 4))
              ]),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 25),
              width: 320,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(const Radius.circular(10)),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(231, 125, 125, 125),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
                border: Border.all(
                  color: const Color.fromARGB(88, 73, 74, 77),
                ),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Text("Jawa Kost Putri - 48",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text('Rules Number 1'),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text('Rules Number 2'),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text('Rules Number 3'),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text('Rules Number 4'),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text('Rules Number 5'),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text('Rules Number 6'),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text('Rules Number 7'),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
