import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sikost/Screen/Home/rules.dart';
import 'dart:math' as math;
import 'package:sikost/Screen/login.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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

  _floatingPanel() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            child: Column(
              children: [
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
                        color: const Color.fromARGB(255, 0, 248, 8),
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
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 10.0)),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                          ),
                          Icon(
                            Icons.receipt_long_sharp,
                            color: Colors.black,
                            size: 14,
                          ),
                          Text(
                            'Tagihan Taufiq Rahmadi',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25.0),
                          ),
                          Icon(Icons.key_sharp, color: Colors.black, size: 14),
                          Text(
                            'Kamar No. 00',
                            style: TextStyle(
                              fontSize: 12,
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
                            children: const [
                              Padding(padding: EdgeInsets.only(left: 10.0)),
                              Icon(
                                Icons.access_time_outlined,
                                color: Colors.black,
                                size: 14,
                              ),
                              Text(
                                'Jatuh Tempo Pada : 20 November 2022',
                                style: TextStyle(
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
                            children: const [
                              Padding(padding: EdgeInsets.only(left: 10.0)),
                              Text(
                                'Sebesar : 500.000',
                                style: TextStyle(fontSize: 12),
                              ),
                              Padding(padding: EdgeInsets.only(left: 150.0)),
                              Icon(
                                Icons.check_circle_outlined,
                                size: 20,
                                color: Color.fromARGB(255, 0, 248, 8),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
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
                  children: [
                    const Padding(padding: EdgeInsets.fromLTRB(35, 80, 0, 0)),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/img/46r.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 60, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Taufiq Rahmadi',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Welcome, Taufiq !',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 75)),
                    ActionChip(
                        backgroundColor: Colors.white,
                        label: const Icon(Icons.notifications, size: 32),
                        onPressed: () {
                          _floatingPanel();
                        })
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
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                                child: Text(
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
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
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
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                      ),
                    ]),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              )),
            ),
            // SlidingUpPanel(
            //   defaultPanelState: PanelState.CLOSED,
            //   minHeight: 50,
            //   collapsed: _floatingCollapsed(),
            //   panelBuilder: _floatingPanel(),
            //   backdropTapClosesPanel: true,
            // )
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
