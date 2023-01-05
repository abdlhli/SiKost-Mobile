// ignore_for_file: avoid_print

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:sikost/Widget/boxShadow.dart';
import 'package:file_picker/file_picker.dart';

import '../api/ApiConstants.dart';

class Pengaduan extends StatefulWidget {
  const Pengaduan({super.key});

  @override
  State<Pengaduan> createState() => _PengaduanState();
}

class _PengaduanState extends State<Pengaduan> {
  final TextEditingController _nama = TextEditingController();
  TextEditingController _noKmr = new TextEditingController();
  TextEditingController _laporan = new TextEditingController();
  TextEditingController _isiPsn = new TextEditingController();

  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;
  final _formKey = GlobalKey<FormState>();

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

  Future<dynamic> pesanPengaduan(
      BuildContext context, nama, noKmr, laporan, isiPsn, lampiranPgd) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(ApiConstants.baseUrl + ApiConstants.postPengaduan));
    request.fields.addAll({
      'nama_pgd': nama,
      'no_kamar_pgd': noKmr,
      'judul_pgd': laporan,
      'isi_pgd': isiPsn,
    });
    request.files.add(await http.MultipartFile.fromPath(
        'lampiran_pgd', pickedFile!.path.toString()));

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
              title: const Text("Pusat Pengaduan",
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
                                "Detail Pesan Pengaduan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                  controller: _nama,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      "Nama",
                                      style: TextStyle(),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Field identitas tidak boleh kosong";
                                    }
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                  controller: _noKmr,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      "No Kamar",
                                      style: TextStyle(),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Field No Kamar tidak boleh kosong";
                                    }
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                  controller: _laporan,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    label: Text("Laporan", style: TextStyle()),
                                    contentPadding: EdgeInsets.only(bottom: 5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Field Laporan tidak boleh kosong";
                                    }
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                  controller: _isiPsn,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  maxLines: 3,
                                  decoration: const InputDecoration(
                                    label:
                                        Text("Isi Pesan", style: TextStyle()),
                                    contentPadding: EdgeInsets.only(bottom: 5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Field Isi Pesan tidak boleh kosong";
                                    }
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Lampiran",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Lampirkan bukti pendukung berupa foto agar tim sikost bisa memahami masalahmu",
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
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
                                                Icons.remove_outlined,
                                                color: Colors.white,
                                              ),
                                        onPressed: () {
                                          setState(() {
                                            pickedFile = null;
                                          });
                                        },
                                      ),
                                    ),
                                    // Text(
                                    //   _fileName.toString(),
                                    //   overflow: TextOverflow.clip,
                                    //   style: const TextStyle(
                                    //       fontSize: 12,
                                    //       fontWeight: FontWeight.w300),
                                    // ),
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
                                          pickFile();
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    // Text(
                                    //   "$_fileName",
                                    //   overflow: TextOverflow.clip,
                                    //   style: const TextStyle(
                                    //       fontSize: 12,
                                    //       fontWeight: FontWeight.w300),
                                    // ),
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
                                            text: "2MB",
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
                                  onPressed: () {
                                    if (_fileName == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Lampiran KTP Tidak Boleh Kosong!')),
                                      );
                                    } else {
                                      if (_formKey.currentState!.validate()) {
                                        pesanPengaduan(
                                            context,
                                            _nama.text,
                                            _noKmr.text,
                                            _laporan.text,
                                            _isiPsn.text,
                                            _fileName);
                                      } else {
                                        print('kosong');
                                      }
                                    }
                                  },
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
