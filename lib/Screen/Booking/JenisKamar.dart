// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sikost/Screen/Booking/KamarMandiDalam.dart';
import 'package:sikost/Screen/Booking/KamarMandiLuar.dart';
import 'package:sikost/Screen/OnBoarding.dart';

class JenisKamar extends StatefulWidget {
  const JenisKamar({super.key});

  @override
  State<JenisKamar> createState() => _JenisKamarState();
}

class _JenisKamarState extends State<JenisKamar> {
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
                padding: EdgeInsets.only(top: 80, bottom: 30),
                child: Text(
                  'Booking Kamar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
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
                  child: Center(
                    child: Text(
                      'Pilih Jenis Kamar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          height: 1),
                    ),
                  )),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 317,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ]),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => KamarMandiLuar()));
                        },
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 158.0)),
                            Text(
                              'Kamar Mandi Luar',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 317,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                              image: AssetImage('assets/img/kamarluar.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 317,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ]),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => KamarMandiDalam()));
                        },
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 158.0)),
                            Text(
                              'Kamar Mandi Dalam',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 317,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            image: AssetImage('assets/img/kamardalam.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 20),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
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
                        child: Center(
                          child: TextButton(
                            child: Text(
                              'Detail Fasilitas Kamar',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ))),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 50, right: 50, top: 70),
                      child: Container(
                          width: 140,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
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
                          child: Center(
                            child: TextButton(
                              child: Text(
                                'Kembali',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => OnBoarding()));
                              },
                            ),
                          ))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
