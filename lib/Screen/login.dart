// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sikost/Screen/register.dart';
import 'package:sikost/Widget/presistent_navbar.dart';
import 'package:http/http.dart' as http;
import 'package:sikost/api/postLogin.dart';

class loginPage extends StatelessWidget {
  TextEditingController usernameA = TextEditingController();
  var passwordA = TextEditingController();

  Future<dynamic> isLogin(BuildContext context, usernameA, passwordA) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.100.14/sikostan/api/Login.php'));
    request.fields.addAll({
      'username': usernameA.text,
      'pass': passwordA.text,
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      var model = cekstatloginFromJson(responseString);
      print(responseString);

      if (model.status == 1) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Berhasil Login!')),
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('fname', model.data[0].firstname);
        prefs.setString('lname', model.data[0].lastname);
        prefs.setString('uname', model.data[0].username);
        prefs.setString('iduser', model.data[0].idUser);
        prefs.setString('profileuser', model.data[0].fotoProfile);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Persistent()));
      } else {
        print("Gagal Login");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal Login! - ${model.message}')),
        );
      }
    } else {
      print(response.reasonPhrase);
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
          child: Stack(
            children: [
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
                        children: [
                          const Text(
                            "LOGIN",
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
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const SizedBox(
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: 390,
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
                              child: TextField(
                                controller: usernameA,
                                decoration: const InputDecoration(
                                  labelText: "Username/Email",
                                  prefixIcon: Icon(Icons.mail_outline),
                                  fillColor: Colors.black,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 35,
                              width: 260,
                              child: TextField(
                                obscureText: true,
                                controller: passwordA,
                                decoration: const InputDecoration(
                                  labelText: "Password",
                                  fillColor: Colors.black,
                                  prefixIcon: Icon(Icons.lock_outline),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Lupa Password?",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                          ),
                                        )),
                                  ]),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 100,
                                ),
                                InkWell(
                                  splashColor: Colors.white,
                                  onTap: () async {
                                    isLogin(context, usernameA, passwordA);
                                    SharedPreferences preferences =
                                        await SharedPreferences.getInstance();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
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
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Don't Have an Account?",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Register()));
                                            },
                                            child: const Text(
                                              "Register",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            )),
                                      ]),
                                )
                              ],
                            )
                          ]))
                ]),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
