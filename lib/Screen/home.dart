import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:sikost/Screen/login.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  logout() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Berhasil logout!')),
    );
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('username');
    preferences.remove('password');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => loginPage()));
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
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(35, 80, 0, 0)),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/img/46r.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 60, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
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
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
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
              decoration: BoxDecoration(
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
                      offset: Offset(4, 4))
                ]),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration:
                  BoxDecoration(color: Color.fromARGB(0, 254, 254, 254)),
              child: SingleChildScrollView(
                  child: Center(
                child: Column(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade600,
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: Offset(0, 2),
                                ),
                              ]),
                          child: Column(
                            children: [
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
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              )),
            ),
            SlidingUpPanel(
              renderPanelSheet: false,
              panel: _floatingPanel(),
              collapsed: _floatingCollapsed(),
              minHeight: 50,
              maxHeight: 300,
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

  Widget _floatingCollapsed() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      child: Center(
        child: Text(
          "Geser ke Atas, Untuk Melihat Tagihan Anda",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _floatingPanel() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.grey.shade600,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
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
                  color: Color.fromARGB(255, 0, 248, 8),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  )
                ]),
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
                      'Tagihan Taufiq Rahmadi',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                          'Jatuh Tempo Pada : 20 November 2022',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 2,
                      indent: 5,
                      endIndent: 5,
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
  }
}
