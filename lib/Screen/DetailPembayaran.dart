// ignore_for_file: file_names, unnecessary_const

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:sikost/Widget/Navigasi.dart';


class DetailPembayaran extends StatefulWidget {
  const DetailPembayaran({Key? key}) : super(key: key);

  @override
  State<DetailPembayaran> createState() => _DetailPembayaranState();
}

class _DetailPembayaranState extends State<DetailPembayaran> {
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
              centerTitle: false,
              title: const Center(
                child: Text(
                  "Pembayaran Terakhir",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
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
          Center(
            child: Container(
              width: 400,
              height: 600,
              decoration: const BoxDecoration(color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Navigasi(),
    );
  }
}
