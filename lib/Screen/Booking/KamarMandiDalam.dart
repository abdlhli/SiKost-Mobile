import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:sikost/Screen/Booking/JenisKamar.dart';
import 'package:sikost/Screen/Booking/Pemesanan.dart';
import 'package:sikost/Widget/presistent_navbar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:sikost/api/getKetersediaanKamar.dart';

import '../../api/ApiConstants.dart';

class KamarMandiDalam extends StatefulWidget {
  KamarMandiDalam({Key? key}) : super(key: key);

  @override
  State<KamarMandiDalam> createState() => _KamarMandiDalamState();

  Future<Getketkamar> fetchData() async {
    final response = await http
        // .get(Uri.parse('http://sikostan.my.id/api/Kamar.php?id_jenis_kamar=1'));
        .get(Uri.parse(ApiConstants.baseUrl + ApiConstants.getKamarKDalam));
    if (response.statusCode == 200) {
      // jika response sukses, parse data menggunakan method getketkamarFromJson
      return Getketkamar.fromJson(json.decode(response.body));
    } else {
      // jika terjadi kesalahan, lempar exception
      throw Exception('Failed to load data');
    }
  }
}

class _KamarMandiDalamState extends State<KamarMandiDalam> {
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
              title: const Text("Kamar Mandi Dalam",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
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
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 20, 136, 204),
                Color.fromARGB(255, 43, 50, 178),
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
              margin: const EdgeInsets.only(bottom: 25),
              width: 320,
              height: 600,
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
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text("List Ketersediaan Kamar",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  ),
                  FutureBuilder<Getketkamar>(
                      future: widget.fetchData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data!.data.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 0, 136, 248),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  231, 125, 125, 125),
                                              spreadRadius: 0,
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                88, 73, 74, 77),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                'Kamar - ${snapshot.data!.data[index].noKamar}',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10)),
                                            Row(
                                              children: [
                                                Text(
                                                    snapshot.data!.data[index]
                                                        .statusKmr,
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 10)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  );
                                }),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      }),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
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
                        child: const Text(
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
                                  builder: (context) => const JenisKamar()));
                        },
                      ),
                    ))),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
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
                        child: const Text(
                          'Lanjut',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Pemesanan()));
                        },
                      ),
                    ))),
          )
        ],
      ),
    );
  }
}
