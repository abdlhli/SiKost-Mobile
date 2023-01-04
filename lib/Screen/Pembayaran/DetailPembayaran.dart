// ignore_for_file: file_names, unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import 'package:sikost/Widget/presistent_navbar.dart';
import 'package:sikost/api/getPembayaranByIdUser.dart';

class DetailPembayaran extends StatefulWidget {
  final Datum data;
  final int index;

  const DetailPembayaran({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  State<DetailPembayaran> createState() => _DetailPembayaranState();

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
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => Persistent()));
                },
                icon: const Icon(Icons.arrow_back_ios_new),
                color: Colors.blue.shade900,
              ),
              title: const Text("Detail Pembayaran",
                  style: const TextStyle(
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
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(bottom: 25),
                width: 320,
                height: 600,
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
                padding: const EdgeInsets.all(15),
                child: FutureBuilder<GetPembayaranIdUser>(
                  future: widget.fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final DateFormat formattgl = DateFormat.yMMMMd();
                      var pemtgl = formattgl
                          .format(snapshot.data!.data[0].tglPembayaran);
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Text("Jawa Kost Putri - 48",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pembayaran Pada: $pemtgl",
                                  style: TextStyle(
                                      color: Color(0xFF939393),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10)),
                              Row(
                                children: [
                                  Icon(Icons.key, size: 15),
                                  Text(
                                      "kamar ${snapshot.data!.data[0].noKamar}",
                                      style: TextStyle(
                                          color: Color(0xFF939393),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10)),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration:
                                  BoxDecoration(color: Color(0xFFEBF1FF)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Bayar",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      "Rp. ${snapshot.data!.data[0].hargaKamar}",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Text("Detail Penerima",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12)),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Nama",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10)),
                                      Text(
                                          "${snapshot.data!.data[0].firstname} ${snapshot.data!.data[0].lastname}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("No Kamar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10)),
                                      Text(
                                          "Kamar ${snapshot.data!.data[0].noKamar}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Alamat",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10)),
                                      Text("${snapshot.data!.data[0].alamat}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Text("Detail Transaksi",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12)),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("ID Transaksi",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10)),
                                      Text(
                                          "#${snapshot.data!.data[0].idPembayaran}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Bukti Foto Kuitansi:",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 140,
                                  child: Image(
                                    image: NetworkImage(
                                        'http://192.168.100.14/sikostan/file/kuitansi/${snapshot.data?.data[0].fotoKuitansi}'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
