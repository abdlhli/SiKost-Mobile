import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:sikost/Widget/boxShadow.dart';
import 'package:file_picker/file_picker.dart';

class Pengaduan extends StatefulWidget {
  const Pengaduan({super.key});

  @override
  State<Pengaduan> createState() => _PengaduanState();
}

class _PengaduanState extends State<Pengaduan> {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Abdullah Ali",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Aab",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
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
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Detail Pesan Pengaduan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  label: Text(
                                    "Identitas",
                                    style: TextStyle(),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.only(bottom: 5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  label: Text("Laporan", style: TextStyle()),
                                  contentPadding:
                                      const EdgeInsets.only(bottom: 5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  label: Text("Isi Pesan", style: TextStyle()),
                                  contentPadding:
                                      const EdgeInsets.only(bottom: 5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lampiran",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lampirkan bukti pendukung berupa foto agar tim sikost bisa memahami masalahmu",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              if (pickedFile != null)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      child: Image.file(fileToDisplay!),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "$_fileName",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
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
                                            ? CircularProgressIndicator()
                                            : Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                        onPressed: () {
                                          print("you touched");
                                          pickFile();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "$_fileName",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                children: [
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
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: 230,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: const [
                                      Color.fromARGB(255, 20, 141, 233),
                                      Color.fromARGB(255, 96, 84, 227),
                                    ],
                                  ),
                                  boxShadow: const [
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
                                  child: Text(
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
