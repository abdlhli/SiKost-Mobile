import 'dart:convert';

import 'package:http/http.dart' as http;

class postRegister {
  String username, pass;

  postRegister({required this.username, required this.pass});

  static Future<postRegister> connectAPI(String username, String pass) async {
    Uri url = Uri.parse("http://192.168.1.6/sikost-web/api/Register.php");
    var hasilRedponse = await http.post(url, body: {
      "username": username,
      "pass": pass,
    });
    var data = json.decode(hasilRedponse.body);

    return postRegister(username: data["username"], pass: data["pass"]);
  }
}
