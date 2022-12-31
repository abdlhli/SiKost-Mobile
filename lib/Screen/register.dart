import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sikost/Screen/login.dart';
import 'package:http/http.dart' as http;
import 'package:sikost/Widget/presistent_navbar.dart';
import 'package:sikost/api/postRegister.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController username = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  register(String username, password) async {
    Map data = {'username': username, 'pass': password};
    print(data);

    String body = jsonEncode(data);
    var url = Uri.parse("http://192.168.1.6/sikost-web/api/Register.php");
    var response = await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Persistent()));
      print('success');
    } else {
      print('error');
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
                  children: [
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
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 35,
                        width: 260,
                        child: TextField(
                          // controller: usernameA,
                          decoration: InputDecoration(
                            labelText: "Nama Lengkap",
                            prefixIcon: Icon(Icons.person),
                            fillColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 35,
                        width: 260,
                        child: TextField(
                          // controller: passwordA,
                          decoration: InputDecoration(
                            labelText: "Username",
                            fillColor: Colors.black,
                            prefixIcon: Icon(Icons.mail_outline),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 35,
                        width: 260,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
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
                            register(username.text, password.text);
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
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                          Color.fromARGB(255, 20, 136, 204),
                                          Color.fromARGB(255, 43, 50, 178),
                                        ])),
                                child: Padding(
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
                                      Text(
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
