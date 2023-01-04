// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sikost/Screen/Home/rules.dart';
import 'dart:math' as math;
import 'package:sikost/Screen/login.dart';
import 'package:http/http.dart' as http;

import '../../api/getPembayaranByIdUser.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
  Future<GetPembayaranIdUser> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('iduser') ?? '';
    final response = await http.get(Uri.parse(
        'http://192.168.100.14/sikostan/api/PembayaranJatuhTempo?id_user=$id'));

    if (response.statusCode == 200) {
      // jika response sukses, parse data menggunakan method getketkamarFromJson
      return GetPembayaranIdUser.fromJson(json.decode(response.body));
    } else {
      // jika terjadi kesalahan, lempar exception
      throw Exception('Failed to load data');
    }
  }
}

class _homeState extends State<home> {
  late final String _photoName;
  late final String _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _getProfileImageUrl();
  }

  Future<void> _getProfileImageUrl() async {
    // Ambil instance SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    // Baca nilai SharedPreferences yang disimpan dengan key 'photoName'
    final photoName = prefs.getString('profileuser');

    // Jika nilai SharedPreferences tersebut ada, simpan ke dalam variabel
    // dan update widget
    if (photoName != null) {
      setState(() {
        _photoName = photoName;
        _profileImageUrl =
            'http://192.168.100.14/sikostan/file/profile/$photoName';
      });
    }
  }

  logout() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Berhasil logout!')),
    );
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('username');
    preferences.remove('password');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => loginPage()));
  }

  _getFullname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fname = prefs.getString('fname') ?? '';
    String lname = prefs.getString('lname') ?? '';
    return "$fname $lname";
  }

  _getFirstname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fname = prefs.getString('fname') ?? '';
    return fname;
  }

  _floatingPanel() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        context: context,
        builder: (context) {
          return SizedBox(
              height: 300,
              child: Column(children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 120, 0, 0),
                    ),
                    Text(
                      'Tagihan Bulan Ini',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                    width: 300,
                    height: 130,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromARGB(255, 248, 0, 0),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600,
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          )
                        ]),
                    child: FutureBuilder<GetPembayaranIdUser>(
                      future: widget.fetchData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final DateFormat formattgl = DateFormat.yMMMMd();
                          var pemtgl = formattgl
                              .format(snapshot.data!.data[0].tglPembayaran);
                          return Column(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.only(top: 10.0)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.receipt_long_sharp,
                                          color: Colors.black,
                                          size: 14,
                                        ),
                                        Text(
                                          'Tagihan ${snapshot.data!.data[0].firstname} ${snapshot.data!.data[0].lastname}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.key_sharp,
                                            color: Colors.black, size: 14),
                                        Text(
                                          'Kamar ${snapshot.data!.data[0].noKamar}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 40.0),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(left: 10.0)),
                                      const Icon(
                                        Icons.access_time_outlined,
                                        color: Colors.black,
                                        size: 14,
                                      ),
                                      Text(
                                        'Jatuh Tempo Pada : $pemtgl',
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
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
                                          padding: EdgeInsets.only(left: 10.0)),
                                      Text(
                                        'Sebesar : Rp. ${snapshot.data!.data[0].hargaKamar}',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const Padding(
                                          padding:
                                              EdgeInsets.only(left: 150.0)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        }
                        return const CircularProgressIndicator();
                      },
                    ))
              ]));
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 160),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                      ),
                      child: Row(
                        children: [
                          FutureBuilder(
                            future: Future.wait([_getProfileImageUrl()]),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(_profileImageUrl),
                                  backgroundColor: Colors.transparent,
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 60, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder(
                                  future: _getFullname(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        snapshot.data,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }
                                    return const CircularProgressIndicator();
                                  },
                                ),
                                FutureBuilder(
                                  future: _getFirstname(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        'Welcome, ${snapshot.data} !',
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 16.0),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }
                                    return const CircularProgressIndicator();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ActionChip(
                          backgroundColor: Colors.white,
                          label: const Icon(Icons.notifications, size: 32),
                          onPressed: () {
                            _floatingPanel();
                          }),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 35),
                      child: Text(
                        'Pengingat Untukmu!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: Stack(children: [
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
                      color: Colors.grey.shade600,
                      spreadRadius: 0,
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
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Stack(children: [
                      Container(
                        height: 200,
                        width: 317,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade600,
                                spreadRadius: 0,
                                blurRadius: 2,
                                offset: const Offset(0, 2),
                              ),
                            ]),
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 150.0)),
                            SizedBox(
                              width: 300,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Rules()),
                                  );
                                },
                                child: const Text(
                                  'Peraturan KOST',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 317,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              image: AssetImage('assets/img/rules.jpg'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Stack(children: [
                      Container(
                        height: 200,
                        width: 317,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade600,
                                spreadRadius: 0,
                                blurRadius: 2,
                                offset: const Offset(0, 2),
                              ),
                            ]),
                        child: Column(
                          children: const [
                            Padding(padding: EdgeInsets.only(top: 165.0)),
                            Text(
                              'Daftar Harga Barang Bawaan',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 317,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              image: AssetImage('assets/img/view.jpg'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )),
            ),
          ]),
        ),
        // bottomNavigationBar: BottomAppBar(
        //   child: new Row(
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       IconButton(
        //         onPressed: () {},
        //         icon: Icon(Icons.home),
        //       ),
        //       IconButton(
        //         onPressed: () {},
        //         icon: Icon(Icons.insert_chart),
        //       ),
        //       IconButton(
        //         onPressed: () {},
        //         icon: Icon(Icons.group),
        //       ),
        //       IconButton(
        //         onPressed: () {},
        //         icon: Icon(Icons.warning_amber_rounded),
        //       ),
        //       IconButton(
        //         onPressed: () {},
        //         icon: Icon(Icons.person),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  // Widget _floatingCollapsed() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.grey.shade50,
  //       borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
  //     ),
  //     child: Center(
  //       child: ActionChip(
  //         onPressed: () {
  //           _floatingPanel();
  //         },
  //         label: Text("Geser ke Atas, Untuk Melihat Tagihan Anda",
  //             style: TextStyle(color: Colors.black)),
  //       ),
  //     ),
  //   );
  // }
}
