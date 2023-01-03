// ignore_for_file: file_names, avoid_print, must_be_immutable

import 'dart:io';
import 'dart:math' as math;
import 'package:file_picker/file_picker.dart';
import 'package:sikost/Widget/boxShadow.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sikost/api/postPemesanan.dart';

class Pemesanan extends StatefulWidget {
  @override
  State<Pemesanan> createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  TextEditingController namapsn = TextEditingController();
  TextEditingController nokampsn = TextEditingController();
  TextEditingController jenispsn = TextEditingController();
  TextEditingController alamatpsn = TextEditingController();
  TextEditingController hppsn = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);
      if (result != null) {
        _fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> pesanKamar(BuildContext context, namapsn, jenispsn, nokampsn,
      alamatpsn, hppsn, lampiranpsn) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.1.66/SiKost/api/Pemesanan.php'));
    request.fields.addAll({
      'jenis_kamar_psn': jenispsn.text,
      'no_kamar_psn': nokampsn.text,
      'nama_psn': namapsn.text,
      'alamat_psn': alamatpsn.text,
      'no_hp_psn': hppsn.text,
    });
    request.files.add(await http.MultipartFile.fromPath(
        'lampiran_ktp_psn', pickedFile!.path.toString()));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

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
                      key: _formKey,
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
                                  controller: namapsn,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      "Nama Lengkap",
                                      style: TextStyle(),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Field Nama Lengkap tidak boleh kosong";
                                    }
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                  controller: alamatpsn,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      "Alamat",
                                      style: TextStyle(),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Field Alamat tidak boleh kosong";
                                    }
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                  controller: hppsn,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    label: Text("No. Hp", style: TextStyle()),
                                    contentPadding: EdgeInsets.only(bottom: 5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Field No Hp tidak boleh kosong";
                                    }
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                  controller: jenispsn,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    label:
                                        Text("Jenis Kamar", style: TextStyle()),
                                    contentPadding: EdgeInsets.only(bottom: 5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Field Jenis Kamar tidak boleh kosong";
                                    }
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                  controller: nokampsn,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    label: Text("No Kamar Yang Kosong",
                                        style: TextStyle()),
                                    contentPadding: EdgeInsets.only(bottom: 5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Field No Kamar Yang Kosong tidak boleh kosong";
                                    }
                                  }),
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
                              if (pickedFile != null)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      child: Image.file(fileToDisplay!),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                )
                              else
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[400],
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: IconButton(
                                        icon: isLoading
                                            ? const CircularProgressIndicator()
                                            : const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                        onPressed: () {
                                          print("you touched");
                                          pickFile();
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
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
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      pesanKamar(context, alamatpsn, nokampsn,
                                          hppsn, namapsn, jenispsn, _fileName);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ))),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
