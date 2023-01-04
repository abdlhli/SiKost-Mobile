import 'dart:convert';

Cekstatlogin cekstatloginFromJson(String str) =>
    Cekstatlogin.fromJson(json.decode(str));

String cekstatloginToJson(Cekstatlogin data) => json.encode(data.toJson());

class Cekstatlogin {
  Cekstatlogin({
    required this.responseCode,
    required this.status,
    required this.message,
    required this.data,
  });

  int responseCode;
  int status;
  String message;
  List<Datum> data;

  factory Cekstatlogin.fromJson(Map<String, dynamic> json) => Cekstatlogin(
        responseCode: json["Response Code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Response Code": responseCode,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.idUser,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.pass,
    required this.noHp,
    required this.alamat,
    required this.tglMasuk,
    required this.fotoProfile,
    required this.asalKampus,
    required this.hakAkses,
    required this.noKamar,
    required this.status,
  });

  String idUser;
  String firstname;
  String lastname;
  String username;
  String pass;
  String noHp;
  String alamat;
  DateTime tglMasuk;
  String fotoProfile;
  String asalKampus;
  String hakAkses;
  String noKamar;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idUser: json["id_user"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        pass: json["pass"],
        noHp: json["no_hp"],
        alamat: json["alamat"],
        tglMasuk: DateTime.parse(json["tgl_masuk"]),
        fotoProfile: json["foto_profile"],
        asalKampus: json["asal_kampus"],
        hakAkses: json["hak_akses"],
        noKamar: json["no_kamar"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "pass": pass,
        "no_hp": noHp,
        "alamat": alamat,
        "tgl_masuk":
            "${tglMasuk.year.toString().padLeft(4, '0')}-${tglMasuk.month.toString().padLeft(2, '0')}-${tglMasuk.day.toString().padLeft(2, '0')}",
        "foto_profile": fotoProfile,
        "asal_kampus": asalKampus,
        "hak_akses": hakAkses,
        "no_kamar": noKamar,
        "status": status,
      };
}
