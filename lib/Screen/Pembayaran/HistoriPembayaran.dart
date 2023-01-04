// ignore_for_file: file_names, unnecessary_const

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sikost/Screen/Pembayaran/DetailPembayaran.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import '../../api/getPembayaranByIdUser.dart';

class HistoriPembayaran extends StatefulWidget {
  const HistoriPembayaran({Key? key}) : super(key: key);

  @override
  State<HistoriPembayaran> createState() => _HistoriPembayaranState();

  Future<GetPembayaranIdUser> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('iduser') ?? '';
    final response = await http.get(
        Uri.parse('http://192.168.100.14/sikostan/api/Pembayaran?id_user=$id'));

    if (response.statusCode == 200) {
      // jika response sukses, parse data menggunakan method getketkamarFromJson
      return GetPembayaranIdUser.fromJson(json.decode(response.body));
    } else {
      // jika terjadi kesalahan, lempar exception
      throw Exception('Failed to load data');
    }
  }
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
              child: FutureBuilder<GetPembayaranIdUser>(
                future: widget.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // jika data selesai diambil, tampilkan data pada widget
                    return ListView.builder(
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (context, index) {
                          final DateFormat formatbulan = DateFormat.MMMM();
                          var pembulan = formatbulan
                              .format(snapshot.data!.data[index].tglPembayaran);
                          final DateFormat formattgl = DateFormat.yMMMMd();
                          var pemtgl = formattgl
                              .format(snapshot.data!.data[index].tglPembayaran);
                          return Center(
                            child: Column(
                              children: [
                                Padding(
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
                                      child: Card(
                                        elevation: 0,
                                        child: Column(
                                          children: [
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10.0)),
                                            Row(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.0),
                                                ),
                                                const Icon(
                                                  Icons.receipt_long_sharp,
                                                  color: Colors.black,
                                                  size: 14,
                                                ),
                                                Text(
                                                  'Pembayaran Bulan $pembulan',
                                                  // 'Pembayaran Bulan ${snapshot.data?.data[index].tglPembayaran}',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 50.0),
                                                ),
                                                Text(
                                                  '#${snapshot.data?.data[index].idPembayaran}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(top: 40.0),
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10.0)),
                                                    const Icon(
                                                      Icons
                                                          .access_time_outlined,
                                                      color: Colors.black,
                                                      size: 14,
                                                    ),
                                                    Text(
                                                      'Pembayaran Pada : $pemtgl',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Divider(
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
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10.0)),
                                                    Text(
                                                      'Sebesar : Rp. ${snapshot.data?.data[index].hargaKamar}',
                                                      style: const TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 40.0)),
                                                    SizedBox(
                                                        height: 30,
                                                        width: 150,
                                                        child: TextButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => DetailPembayaran(index: index, data: snapshot.data!.data[index])),
                                                            );
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'Dengan detail sebagai berikut',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade400,
                                                                  fontSize: 10,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                              ),
                                                              const Icon(
                                                                Icons
                                                                    .expand_circle_down_outlined,
                                                                size: 12,
                                                              )
                                                            ],
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    // jika terjadi error, tampilkan pesan error
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // jika data belum selesai diambil, tampilkan loading indicator
                    return const CircularProgressIndicator();
                  }
                },
              )),
        ],
      ),
    );
  }
}
