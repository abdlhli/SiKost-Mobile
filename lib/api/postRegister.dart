import 'dart:convert';

KirimRegister kirimRegisterFromJson(String str) =>
    KirimRegister.fromJson(json.decode(str));

String kirimRegisterToJson(KirimRegister data) => json.encode(data.toJson());

class KirimRegister {
  KirimRegister({
    required this.responseCode,
    required this.status,
    required this.message,
  });

  int responseCode;
  int status;
  String message;

  factory KirimRegister.fromJson(Map<String, dynamic> json) => KirimRegister(
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
