// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sikost/Screen/OnBoarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widget/boxShadow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import '../api/ApiConstants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _hpController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _kampusController = TextEditingController();

  File? image;
  final ImagePicker _picker = ImagePicker();
  String? imgPath;

  Future<void> updateData(BuildContext context) async {
    // Ambil data dari form field
    String fname = _fnameController.text;
    String lname = _lnameController.text;
    String hp = _hpController.text;
    String alamat = _alamatController.text;
    String kampus = _kampusController.text;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('iduser') ?? '';

    // Kirim request update data ke API
    final response = await http.post(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.postUpdateUser + id),
        body: {
          'firstname': fname,
          'lastname': lname,
          'no_hp': hp,
          'alamat': alamat,
          'asal_kampus': kampus,
        });

    // Tangani response dari API
    if (response.statusCode == 200) {
      // Tampilkan pesan sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil diupdate')),
      );
    } else {
      // Tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Terjadi kesalahan')),
      );
    }
  }

  Future _getFormGallery() async {
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    if (imagePicked == null) return;
    // image = File(imagePicked.path);

    // getting a directory path for saving
    final Directory exDir = await getApplicationDocumentsDirectory();
    String dirPath = exDir.path;
    final String fileName = basename(imagePicked.path);
    final String fileExtension = extension(imagePicked.path);
    final String filePath = '$dirPath/$fileName$fileExtension';

    // copy the file to a new path
    await imagePicked.saveTo(filePath);
    // final File newImage = await imagePicked.path;
    if (imagePicked.path != null) {
      setState(() async {
        image = File(filePath);
        print("foto profil telah di ganti");
      });
    }
  }

  _getUserdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> data = {
      'fname': prefs.getString('fname') ?? '',
      'lname': prefs.getString('lname') ?? '',
      'hp': prefs.getString('hp') ?? '',
      'alamat': prefs.getString('alamat') ?? '',
      'kampus': prefs.getString('kampus') ?? '',
      'iduser': prefs.getString('iduser') ?? '',
      'profileuser': prefs.getString('profileuser') ?? '',
    };
    return data;
  }

  void _ambilFoto() async {
    var imagePicked = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(imagePicked!.path);

      isImagePicked = true;
    });
  }

  // Future _getFormGallery() async {
  //   final XFile? imagePicked =
  //       await _picker.pickImage(source: ImageSource.gallery);
  //   image = File(imagePicked!.path);
  //   setState(() {
  //     isImagePicked = true;
  //   });
  // }

  logout(context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Berhasil logout!')),
    );
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('username');
    preferences.remove('password');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => OnBoarding()));
  }

  snekbar(String content) {
    return SnackBar(
      content: Text(content,
          style: const TextStyle(color: Colors.white, fontSize: 12)),
      backgroundColor: Colors.grey,
    );
  }

  final _formKey = GlobalKey<FormState>();
  bool isImagePicked = true;
  bool isEnabled = false;
  bool isObsecureText = true;
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 43, 50, 178),
                  Color.fromARGB(255, 20, 136, 204),
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
          ),
          Center(
            child: ListView(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Profil",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      profileimg(),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, right: 40, left: 40, bottom: 10),
                        child: Container(
                          // height: MediaQuery.of(context).size.height,
                          // width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [boxShadow()]),
                          child: FutureBuilder(
                            future: _getUserdata(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Form(
                                    key: _formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        buildTextForm(
                                          "Nama Depan",
                                          // snapshot.data["fname"],
                                          false,
                                          _fnameController,
                                        ),
                                        buildTextForm(
                                          "Nama Belakang",
                                          // snapshot.data["lname"],
                                          false,
                                          _lnameController,
                                        ),

                                        buildTextForm(
                                          "No WA",
                                          // snapshot.data["hp"],
                                          false,
                                          _hpController,
                                        ),
                                        buildTextForm(
                                          "Alamat",
                                          // snapshot.data["alamat"],
                                          false,
                                          _alamatController,
                                        ),
                                        buildTextForm(
                                          "Kampus",
                                          // snapshot.data["kampus"],
                                          false,
                                          _kampusController,
                                        ),
                                        // buildTextForm(
                                        //     "Email", "fagilnuril18@gmail.com", false),
                                        // buildTextForm("Password", "", true),
                                        // buildTextForm("New Password", "", true),
                                      ],
                                    ));
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              return const CircularProgressIndicator();
                            },
                          ),
                        ),
                      ),
                    ]),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 40, left: 40, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Edit Mode"),
                      Switch(
                        value: isEnabled,
                        onChanged: (value) {
                          setState(() {
                            isEnabled = !isEnabled;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 50),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          // SaveImage(image!.path);
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     snekbar("Data Berhasil Diperbarui"));
                          updateData(context);
                        },
                        child: Container(
                          // margin: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(80, 0, 0, 0),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(0, 5),
                              )
                            ],
                            // shape: StadiumBorder(),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromARGB(255, 20, 141, 233),
                                Color.fromARGB(255, 96, 84, 227),
                              ],
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snekbar("Keluar"));
                          Navigator.of(context, rootNavigator: true)
                              .pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return OnBoarding();
                              },
                            ),
                            (_) => false,
                          );
                        },
                        child: Container(
                          // margin: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(80, 0, 0, 0),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(0, 5),
                              )
                            ],
                            // shape: StadiumBorder(),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromARGB(255, 231, 51, 75),
                                Color.fromARGB(255, 194, 39, 39),
                              ],
                            ),
                          ),

                          child: const Center(
                              child: Text(
                            "Keluar",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // bottomsheet(context) {
  //   return showModalBottomSheet(
  //       backgroundColor: Colors.white,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20), topRight: Radius.circular(20)),
  //       ),
  //       context: context,
  //       builder: (context) => Container(
  //             padding: const EdgeInsets.all(10),
  //             height: 120,
  //             width: MediaQuery.of(context).size.width,
  //             // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  //             child: Column(
  //               children: [
  //                 const Center(
  //                   child: Text(
  //                     "Pilih foto profil kamu",
  //                     style: TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.blue),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: <Widget>[
  //                     TextButton.icon(
  //                         icon: const Icon(Icons.camera_alt_rounded),
  //                         onPressed: () async {
  //                           await _getFormCamera();
  //                         },
  //                         label: const Text("Kamera")),
  //                     TextButton.icon(
  //                         onPressed: () async {
  //                           await _getFormGallery();
  //                         },
  //                         icon: const Icon(Icons.image),
  //                         label: const Text("File")),
  //                     TextButton.icon(
  //                         onPressed: () {
  //                           setState(() {
  //                             isImagePicked = false;
  //                           });
  //                         },
  //                         icon: const Icon(Icons.delete),
  //                         label: const Text("Hapus"))
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ));
  // }

  Widget profileimg() {
    return Stack(
      children: [
        isImagePicked
            ? imgPath != null
                ? Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 2,
                            color: Colors.black.withOpacity(0.1))
                      ],
                      border: Border.all(width: 4, color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image(
                        image: FileImage(File(imgPath!)),
                        height: 130,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                      // child: Image.file(
                      //   height: 130,
                      //   width: 130,
                      //   image!,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  )
                : defaultImage()
            : defaultImage(),
        Positioned(
          bottom: 0,
          right: 0,
          child: ActionChip(
            label: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
            backgroundColor: Colors.white,
            onPressed: () async {
              _ambilFoto();
              setState(() {
                isImagePicked = true;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget buildTextForm(
      String label, bool isPassTextField, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
          validator: (value) {
            // if (value == null || value.isEmpty) {
            //   return isPassTextField ? null : "Field $label tidak boleh kosong";
            // } else if (label == "email" || label == "Email") {
            //   return (value.contains("@")) ? null : "Masukkan email yang valid";
            // }
            // return null;
          },
          // initialValue: placeholder,
          controller: controller,
          enabled: isEnabled,
          obscureText: isPassTextField ? isObsecureText : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              labelText: label,
              // suffixIcon: isPassTextField
              //     ?
              //     // true
              //     IconButton(
              //         onPressed: () {
              //           setState(() {
              //             isObsecureText = !isObsecureText;
              //           });
              //         },
              //         icon: Icon(
              //           Icons.remove_red_eye,
              //           color: Colors.grey,
              //         ))
              //     :
              //     // false
              //     null,
              contentPadding: const EdgeInsets.only(bottom: 5),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // hintText: placeholder,

              hintStyle: const TextStyle(fontSize: 16, color: Colors.grey))),
    );
  }

  Widget defaultImage() {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 134, 134, 134),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              spreadRadius: 2,
              color: Colors.black.withOpacity(0.1))
        ],
        border: Border.all(width: 4, color: Colors.white),
        shape: BoxShape.circle,
        // image: DecorationImage(
        //     image: AssetImage('assets/img/foto.jpg'),
        //     fit: BoxFit.cover),
      ),
      child: const Icon(
        Icons.person,
        size: 100,
        color: Colors.white,
      ),
    );
  }

  void SaveImage(path) async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    saveImage.setString("imagepath", path);
  }

  void LoadImage() async {
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    setState(() {
      imgPath = saveImage.getString("imagepath");
    });
  }
}
