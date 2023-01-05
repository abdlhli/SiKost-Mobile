import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:sikost/api/getUser.dart';

import '../api/ApiConstants.dart';

class penghuni extends StatefulWidget {
  const penghuni({super.key});

  @override
  State<penghuni> createState() => _penghuniState();

  Future<GetUser> fetchData() async {
    final response =
        await http.get(Uri.parse(ApiConstants.baseUrl + ApiConstants.getUser));
    if (response.statusCode == 200) {
      // jika response sukses, parse data menggunakan method getketkamarFromJson
      return GetUser.fromJson(json.decode(response.body));
    } else {
      // jika terjadi kesalahan, lempar exception
      throw Exception('Failed to load data');
    }
  }
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(231, 125, 125, 125),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
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
                  FutureBuilder<GetUser>(
                    future: widget.fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // jika data selesai diambil, tampilkan data pada widget
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 255,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: ListView.builder(
                                    itemCount: snapshot.data!.data.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: CircleAvatar(
                                          radius: 22,
                                          backgroundImage: NetworkImage(
                                              '${ApiConstants.baseUrl}${ApiConstants.getPhotoProfile}${snapshot.data?.data[index].fotoProfile}'),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        title: Text(
                                          '${snapshot.data?.data[index].firstname} ${snapshot.data?.data[index].lastname}',
                                          style: const TextStyle(fontSize: 17),
                                        ),
                                        subtitle: Text(
                                            'Kamar - ${snapshot.data?.data[index].noKamar}'),
                                        onTap: () {
                                          print('object');
                                        },
                                      );
                                    }),
                              ),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        // jika terjadi error, tampilkan pesan error
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // jika data belum selesai diambil, tampilkan loading indicator
                        return const CircularProgressIndicator();
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
