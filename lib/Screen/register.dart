// ignore_for_file: sized_box_for_whitespace, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sikost/Screen/login.dart';
import 'package:http/http.dart' as http;
import 'package:sikost/api/postRegister.dart';

import '../api/ApiConstants.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameR = TextEditingController();
  TextEditingController passwordR = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();

  Future<dynamic> isRegister(
      BuildContext context, usernameR, passwordR, fname, lname) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(ApiConstants.baseUrl + ApiConstants.postRegister));
    request.fields.addAll({
      'firstname': fname.text,
      'lastname': lname.text,
      'username': usernameR.text,
      'pass': passwordR.text,
    });

    http.StreamedResponse response = await request.send();
    var responseString = await response.stream.bytesToString();
    var model = KirimRegister.fromJson(json.decode(responseString));

    if (response.statusCode == 200) {
      if (model.status == 1) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Berhasil Membuat Akun! - ${model.message}')),
        );
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => loginPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal Membuat Akun! - ${model.message}')),
        );
      }
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(children: [
        Container(
          height: 310,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 20, 136, 204),
                    Color.fromARGB(255, 43, 50, 178),
                  ]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ]),
          child: Column(children: [
            const SizedBox(
              height: 70,
            ),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "REGISTER",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ))
          ]),
        ),
        ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 450,
                width: 321,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(4, 4),
                      ),
                    ]),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 35,
                        width: 260,
                        child: TextFormField(
                          controller: fname,
                          decoration: const InputDecoration(
                            labelText: "Nama Depan",
                            prefixIcon: Icon(Icons.person),
                            fillColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 35,
                        width: 260,
                        child: TextFormField(
                          controller: lname,
                          decoration: const InputDecoration(
                            labelText: "Nama Belakang",
                            prefixIcon: Icon(Icons.person),
                            fillColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 35,
                        width: 260,
                        child: TextFormField(
                          controller: usernameR,
                          decoration: const InputDecoration(
                            labelText: "Username",
                            fillColor: Colors.black,
                            prefixIcon: Icon(Icons.mail_outline),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 35,
                        width: 260,
                        child: TextFormField(
                          controller: passwordR,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            fillColor: Colors.black,
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      InkWell(
                          splashColor: Colors.white,
                          onTap: () async {
                            isRegister(
                                context, usernameR, passwordR, fname, lname);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 150,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                          Color.fromARGB(255, 20, 136, 204),
                                          Color.fromARGB(255, 43, 50, 178),
                                        ])),
                                child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Already Have an Account?",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            loginPage()));
                                          },
                                          child: const Text(
                                            "Login",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                            ),
                                          )),
                                    ]),
                              ),
                            ],
                          ))
                    ]),
              ),
            ],
          ),
        ]),
      ]),
    )));
  }
}
