import 'package:bottom_bar_matu/components/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class penghuni extends StatefulWidget {
  const penghuni({super.key});

  @override
  State<penghuni> createState() => _penghuniState();
}

class _penghuniState extends State<penghuni> {
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
              title: const Text("Info Penghuni Kost",
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
                    color: Colors.grey.shade600,
                    spreadRadius: 0,
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
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 30,
                          width: 270,
                          child: TextField(
                            // controller: usernameA,
                            decoration: InputDecoration(
                              labelText: "Cari Penghuni",
                              prefixIcon: Icon(Icons.search),
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 255,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: ListView.builder(
                                  itemCount: 28,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        size: 40,
                                      ),
                                      title: Text(
                                        "Nama Penghuni",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      subtitle: Text("aktif"),
                                      onTap: () {
                                        print('object');
                                      },
                                    );
                                  }),
                            ),
                          ),
                        )
                      ])))
        ],
      ),
    );
  }
}
