import 'dart:convert';

import 'package:http/http.dart' as http;

class postLogin {
  String username, pass;

  postLogin({required this.username, required this.pass});

  static Future<postLogin> connectAPI(String username, String pass) async {
    Uri url = Uri.parse("http://sikostan.my.id/api/login");
    var hasilRedponse = await http.post(url, body: {
      "username": username,
      "pass": pass,
    });
    var data = json.decode(hasilRedponse.body);

    return postLogin(username: data["username"], pass: data["pass"]);
  }
}
