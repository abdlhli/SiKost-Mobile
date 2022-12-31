import 'dart:convert';

import 'package:http/http.dart' as http;

class postRegister {
  String fullname, username, pass, noTelp;

  postRegister(
      {required this.fullname,
      required this.username,
      required this.pass,
      required this.noTelp});

  static Future<postRegister> connectAPI(
      String fullname, String username, String pass, String noTelp) async {
    Uri url = Uri.parse("http://sikostan.my.id/api/register.php");
    var hasilRedponse = await http.post(url, body: {
      "nama_lngkp": fullname,
      "username": username,
      "pass": pass,
      "no_telepon": noTelp,
    });
    var data = json.decode(hasilRedponse.body);

    return postRegister(
        fullname: data["nama_lngkp"],
        username: data["username"],
        pass: data["pass"],
        noTelp: data["noTelp"]);
  }
}
