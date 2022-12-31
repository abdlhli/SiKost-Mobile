import 'dart:convert';

Cekstatlogin cekstatloginFromJson(String str) =>
    Cekstatlogin.fromJson(json.decode(str));

String cekstatloginToJson(Cekstatlogin data) => json.encode(data.toJson());

class Cekstatlogin {
  Cekstatlogin({
    required this.responseCode,
    required this.status,
    required this.message,
  });

  int responseCode;
  int status;
  String message;

  factory Cekstatlogin.fromJson(Map<String, dynamic> json) => Cekstatlogin(
        responseCode: json["Response Code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "Response Code": responseCode,
        "status": status,
        "message": message,
      };
}
