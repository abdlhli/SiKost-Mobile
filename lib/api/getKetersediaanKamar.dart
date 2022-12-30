// class getketkamar {
//   String noKamar;
//   String statusKmr;

//   getketkamar({required this.noKamar, required this.statusKmr});

//   factory getketkamar.fromJson(Map<String, dynamic> json) {
//     return getketkamar(
//         noKamar: json['no_kamar'], statusKmr: json['status_kmr']);
//   }
// }

// To parse this JSON data, do
//
//     final getketkamar = getketkamarFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Getketkamar getketkamarFromJson(String str) =>
    Getketkamar.fromJson(json.decode(str));

String getketkamarToJson(Getketkamar data) => json.encode(data.toJson());

class Getketkamar {
  Getketkamar({
    required this.data,
  });

  List<Datum> data;

  factory Getketkamar.fromJson(Map<String, dynamic> json) => Getketkamar(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.noKamar,
    required this.idJenisKamar,
    required this.statusKmr,
  });

  String noKamar;
  String idJenisKamar;
  String statusKmr;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        noKamar: json["no_kamar"],
        idJenisKamar: json["id_jenis_kamar"],
        statusKmr: json["status_kmr"],
      );

  Map<String, dynamic> toJson() => {
        "no_kamar": noKamar,
        "id_jenis_kamar": idJenisKamar,
        "status_kmr": statusKmr,
      };
}
