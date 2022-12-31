import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:sikost/Widget/boxShadow.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;

class Pemesanan extends StatefulWidget {
  const Pemesanan({Key? key}) : super(key: key);

  @override
  State<Pemesanan> createState() => _PemesananState();

}

class _PemesananState extends State<Pemesanan> {
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
              title: const Text("Pemesanan Kamar",
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
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40),
            child: ListView(children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                      child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [boxShadow()]),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Isi Data Pemesan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  label: Text(
                                    "Nama Lengkap",
                                    style: TextStyle(),
                                  ),
                                  contentPadding: EdgeInsets.only(bottom: 5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  label: Text(
                                    "Alamat",
                                    style: TextStyle(),
                                  ),
                                  contentPadding: EdgeInsets.only(bottom: 5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  label: Text("No. Hp", style: TextStyle()),
                                  contentPadding: EdgeInsets.only(bottom: 5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  label:
                                      Text("Jenis Kamar", style: TextStyle()),
                                  contentPadding: EdgeInsets.only(bottom: 5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Lampiran",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Lampirkan foto ktp untuk mendata pemesan",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // if (pickedFile != null)
                              //   Row(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     children: [
                              //       Container(
                              //         height: 100,
                              //         child: Image.file(fileToDisplay!),
                              //       ),
                              //       const SizedBox(
                              //         width: 20,
                              //       ),
                              //       Text(
                              //         "$_fileName",
                              //         style: const TextStyle(
                              //             fontSize: 12,
                              //             fontWeight: FontWeight.w300),
                              //       ),
                              //     ],
                              //   )
                              // else
                              //   Row(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     children: [
                              //       Container(
                              //         width: 50,
                              //         height: 50,
                              //         decoration: BoxDecoration(
                              //             color: Colors.grey[400],
                              //             borderRadius:
                              //                 BorderRadius.circular(12)),
                              //         child: IconButton(
                              //           icon: isLoading
                              //               ? const CircularProgressIndicator()
                              //               : const Icon(
                              //                   Icons.add,
                              //                   color: Colors.white,
                              //                 ),
                              //           onPressed: () {
                              //             print("you touched");
                              //             pickFile();
                              //           },
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         width: 20,
                              //       ),
                              //       Text(
                              //         "$_fileName",
                              //         style: const TextStyle(
                              //             fontSize: 12,
                              //             fontWeight: FontWeight.w300),
                              //       ),
                              //     ],
                              //   ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text.rich(TextSpan(
                                      text: "*  pastikan jenis file berupa ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ".PNG, .JPG, .JPEG",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold))
                                      ])),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text.rich(TextSpan(
                                      text: "*  maksimal ukuran file ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "5MB",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold))
                                      ])),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: 230,
                                height: 50,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color.fromARGB(255, 20, 141, 233),
                                      Color.fromARGB(255, 96, 84, 227),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(80, 0, 0, 0),
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: Offset(0, 5),
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                ),
                                child: TextButton(
                                  child: const Text(
                                    'Kirim',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          )))
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
