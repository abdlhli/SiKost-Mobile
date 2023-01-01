import 'dart:convert';

GetUser getUserFromJson(String str) => GetUser.fromJson(json.decode(str));

String getUserToJson(GetUser data) => json.encode(data.toJson());

class GetUser {
    GetUser({
        required this.data,
    });

    List<Datum> data;

    factory GetUser.fromJson(Map<String, dynamic> json) => GetUser(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
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
    String tglMasuk;
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
        tglMasuk: json["tgl_masuk"],
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
        "tgl_masuk": tglMasuk,
        "foto_profile": fotoProfile,
        "asal_kampus": asalKampus,
        "hak_akses": hakAkses,
        "no_kamar": noKamar,
        "status": status,
    };
}
