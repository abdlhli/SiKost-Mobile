import 'dart:convert';

GetPembayaranIdUser getPembayaranIdUserFromJson(String str) =>
    GetPembayaranIdUser.fromJson(json.decode(str));

String getPembayaranIdUserToJson(GetPembayaranIdUser data) =>
    json.encode(data.toJson());

class GetPembayaranIdUser {
  GetPembayaranIdUser({
    required this.responseCode,
    required this.status,
    required this.message,
    required this.data,
  });

  int responseCode;
  int status;
  String message;
  List<Datum> data;

  factory GetPembayaranIdUser.fromJson(Map<String, dynamic> json) =>
      GetPembayaranIdUser(
        responseCode: json["Response Code"],
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
    required this.idPembayaran,
    required this.idUser,
    required this.kamar,
    required this.tglPembayaran,
    required this.hargaKamar,
    required this.fotoKuitansi,
    required this.statusPembayaran,
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

  String idPembayaran;
  String idUser;
  String kamar;
  DateTime tglPembayaran;
  String hargaKamar;
  String fotoKuitansi;
  String statusPembayaran;
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
        idPembayaran: json["id_pembayaran"],
        idUser: json["id_user"],
        kamar: json["kamar"],
        tglPembayaran: DateTime.parse(json["tgl_pembayaran"]),
        hargaKamar: json["harga_kamar"],
        fotoKuitansi: json["foto_kuitansi"],
        statusPembayaran: json["status_pembayaran"],
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
        "id_pembayaran": idPembayaran,
        "id_user": idUser,
        "kamar": kamar,
        "tgl_pembayaran":
            "${tglPembayaran.year.toString().padLeft(4, '0')}-${tglPembayaran.month.toString().padLeft(2, '0')}-${tglPembayaran.day.toString().padLeft(2, '0')}",
        "harga_kamar": hargaKamar,
        "foto_kuitansi": fotoKuitansi,
        "status_pembayaran": statusPembayaran,
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
