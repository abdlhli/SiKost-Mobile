// ignore_for_file: file_names, unnecessary_const

import 'package:flutter/material.dart';
import 'package:sikost/Screen/DetailPembayaran.dart';
import 'dart:math' as math;

import 'package:sikost/Widget/Navigasi.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const HistoriPembayaran(),
    );
  }
}

class HistoriPembayaran extends StatefulWidget {
  const HistoriPembayaran({Key? key}) : super(key: key);

  @override
  State<HistoriPembayaran> createState() => _HistoriPembayaranState();
}

class _HistoriPembayaranState extends State<HistoriPembayaran> {
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
              title: const Text(
                "Pembayaran Terakhir",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
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
                    color: Colors.grey.shade900,
                    spreadRadius: 4,
                    blurRadius: 8,
                    offset: const Offset(4, 4))
              ]),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:
                const BoxDecoration(color: Color.fromARGB(0, 254, 254, 254)),
            child: SingleChildScrollView(
                child: Center(
              child: Column(
                children: const [
                  KotakHistori(),
                  KotakHistori(),
                  KotakHistori(),
                  KotakHistori(),
                  SizedBox(
                    height: 300,
                  )
                ],
              ),
            )),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   elevation: 2.0,
      //   child: const Icon(Icons.home),
      // ),
      // bottomNavigationBar: const Navigasi(),
    );
  }
}

class KotakHistori extends StatelessWidget {
  const KotakHistori({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
          height: 150,
          width: 317,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              const Radius.circular(10),
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
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    Icon(
                      Icons.receipt_long_sharp,
                      color: Colors.black,
                      size: 14,
                    ),
                    Text(
                      'Pembayaran Bulan Maret',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 88.0),
                    ),
                    Text(
                      '#200',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10.0)),
                        Icon(
                          Icons.access_time_outlined,
                          color: Colors.black,
                          size: 14,
                        ),
                        Text(
                          'Pembayaran Pada : 08 Maret 2023',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10.0)),
                        Text(
                          'Sebesar : 500.000',
                          style: TextStyle(fontSize: 12),
                        ),
                        Padding(padding: EdgeInsets.only(left: 50.0)),
                        SizedBox(
                            height: 30,
                            width: 150,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPembayaran()),
                                );
                              },
                              child: Text(
                                'Dengan detail sebagai berikut',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 10,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
