import 'dart:io';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sikost/Screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sikost/Widget/presistent_navbar.dart';
import '../Widget/boxShadow.dart';
import 'package:sikost/Widget/presistent_navbar.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? image;
  final ImagePicker _picker = ImagePicker();

  Future _getFormGallery() async {
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {});
  }

  Future _getFormCamera() async {
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.camera);
    image = File(imagePicked!.path);
    setState(() {});
  }

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

  snekbar(String content) {
    return SnackBar(
      content:
          Text(content, style: TextStyle(color: Colors.white, fontSize: 12)),
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
            decoration: BoxDecoration(
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
            child: ListView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Profil",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  profileimg(),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40, right: 40, left: 40, bottom: 10),
                    child: Container(
                      // height: MediaQuery.of(context).size.height,
                      // width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10),
                          ),
                          boxShadow: [boxShadow()]),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextForm("Nama Depan", "Fagil Nuril", false),
                              buildTextForm("Nama Belakang", "Akbar", false),
                              buildTextForm(
                                  "Email", "fagilnuril18@gmail.com", false),
                              buildTextForm("No WA", "087855913391", false),
                              buildTextForm("Alamat", "Jember", false),
                              buildTextForm(
                                  "Kampus", "Politeknik Negeri Jember", false),
                              buildTextForm("Password", "", true),
                              buildTextForm("New Password", "", true),
                              Row(
                                children: [
                                  Checkbox(
                                    value: _isSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        isObsecureText = !isObsecureText;
                                        _isSelected = !_isSelected;
                                      });
                                    },
                                  ),
                                  Text("Tampilkan Password")
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 40, left: 40, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Edit Mode"),
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
                    padding: EdgeInsets.only(left: 40, right: 40, bottom: 50),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                snekbar("Data Berhasil Diperbarui"));
                          },
                          child: Container(
                            // margin: EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(80, 0, 0, 0),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 5),
                                )
                              ],
                              // shape: StadiumBorder(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color.fromARGB(255, 20, 141, 233),
                                  Color.fromARGB(255, 96, 84, 227),
                                ],
                              ),
                            ),
                            child: Center(
                                child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snekbar("Keluar"));
                          },
                          child: Container(
                            // margin: EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(80, 0, 0, 0),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 5),
                                )
                              ],
                              // shape: StadiumBorder(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color.fromARGB(255, 231, 51, 75),
                                  Color.fromARGB(255, 194, 39, 39),
                                ],
                              ),
                            ),

                            child: Center(
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
            ]),
          )
        ],
      ),
    );
  }

  bottomsheet() {
    return showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        context: context,
        builder: (context) => Container(
              padding: EdgeInsets.all(10),
              height: 120,
              width: MediaQuery.of(context).size.width,
              // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Pilih foto profil kamu",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton.icon(
                          icon: Icon(Icons.camera_alt_rounded),
                          onPressed: () async {
                            await _getFormCamera();

                            setState(() {
                              isImagePicked = true;
                            });
                          },
                          label: Text("Kamera")),
                      TextButton.icon(
                          onPressed: () async {
                            await _getFormGallery();

                            setState(() {
                              isImagePicked = true;
                            });
                          },
                          icon: Icon(Icons.image),
                          label: Text("File")),
                      TextButton.icon(
                          onPressed: () {
                            setState(() {
                              isImagePicked = false;
                            });
                          },
                          icon: Icon(Icons.delete),
                          label: Text("Hapus"))
                    ],
                  ),
                ],
              ),
            ));
  }

  Widget profileimg() {
    return Stack(
      children: [
        isImagePicked
            ? image != null
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
                      child: Image.file(
                        height: 130,
                        width: 130,
                        image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : defaultImage()
            : defaultImage(),
        Positioned(
          bottom: 0,
          right: 0,
          child: ActionChip(
            label: Icon(
              Icons.edit,
              color: Colors.blue,
            ),
            backgroundColor: Colors.white,
            onPressed: bottomsheet,
          ),
        ),
      ],
    );
  }

  Widget buildTextForm(
    String label,
    String placeholder,
    bool isPassTextField,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return isPassTextField ? null : "Field $label tidak boleh kosong";
            } else if (label == "email" || label == "Email") {
              return (value.contains("@")) ? null : "Masukkan email yang valid";
            }
            return null;
          },
          initialValue: placeholder,
          enabled: (label == "email" || label == "Email") ? false : isEnabled,
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
              contentPadding: EdgeInsets.only(bottom: 5),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // hintText: placeholder,

              hintStyle: TextStyle(fontSize: 16, color: Colors.grey))),
    );
  }

  Widget defaultImage() {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 134, 134, 134),
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
      child: Icon(
        Icons.person,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}
