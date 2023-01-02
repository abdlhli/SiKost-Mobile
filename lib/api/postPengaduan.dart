import 'dart:convert';

KirimPemesanan kirimPengaduanFromJson(String str) =>
    KirimPemesanan.fromJson(json.decode(str));

String kirimPemesananToJson(KirimPemesanan data) => json.encode(data.toJson());

class KirimPemesanan {
  KirimPemesanan({
    required this.responseCode,
    required this.status,
    required this.message,
  });

  int responseCode;
  int status;
  String message;

  factory KirimPemesanan.fromJson(Map<String, dynamic> json) => KirimPemesanan(
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
