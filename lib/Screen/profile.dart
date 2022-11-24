import 'package:flutter/material.dart';
import 'package:sikost/Screen/login.dart';

import '../Widget/boxShadow.dart';

// void main() {
//   runApp(Profile());
// }

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  bool isObsecureField = true;
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
                    padding: const EdgeInsets.all(40),
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
                              buildTextForm("Nama", "Fagil Nuril Akbar", false),
                              buildTextForm(
                                  "Email", "fagilnuril18@gmail.com", false),
                              buildTextForm("No WA", "087855913391", false),
                              buildTextForm("Alamat", "Jember", false),
                              buildTextForm(
                                  "Kampus", "Politeknik Negeri Jember", false),
                              buildTextForm("Password", "", true),
                              buildTextForm("New Password", "", true)
                            ],
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40, right: 40, bottom: 50),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 50),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Berhasil Menyimpan")));
                            }
                          },
                          child: Text("Save"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.black.withOpacity(0.2),
                              primary: Colors.red,
                              shape: StadiumBorder(),
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => loginPage()));
                            },
                            child: Text("Keluar")),
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

  Widget bottomsheet() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.black),
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
                  onPressed: () {},
                  label: Text("Kamera")),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.image),
                  label: Text("File"))
            ],
          ),
        ],
      ),
    );
  }

  Widget profileimg() {
    return Stack(
      children: [
        Container(
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
              image: DecorationImage(
                  image: AssetImage(
                    'assets/img/foto.jpg',
                  ),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              showBottomSheet(
                  context: context, builder: (builder) => bottomsheet());
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Colors.white),
                  color: Colors.blue),
              child: Center(
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
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
              return "Field $label tidak boleh kosong";
            } else if (label == "email" || label == "Email") {
              return (value.contains("@")) ? null : "Masukkan email yang valid";
            }
            return null;
          },
          initialValue: placeholder,
          enabled: (label == "email" || label == "Email") ? false : true,
          obscureText: isPassTextField ? isObsecureField : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              labelText: label,
              suffixIcon: isPassTextField
                  ?
                  // true
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isObsecureField = !isObsecureField;
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      )
                      )
                  :
                  // false
                  null,
              contentPadding: EdgeInsets.only(bottom: 5),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // hintText: placeholder,

              hintStyle: TextStyle(fontSize: 16, color: Colors.grey))),
    );
  }
}
