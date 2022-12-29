import 'dart:convert';

import 'package:http/http.dart' as http;

class PostPengduan {
  String id, nama_pgd, no_kamar_pgd, judul_pgd, isi_pgd, lampiran;

  PostPengduan(
      {required this.id,
      required this.nama_pgd,
      required this.no_kamar_pgd,
      required this.judul_pgd,
      required this.lampiran,
      required this.isi_pgd});

  static Future<PostPengduan> connectAPI(String nama_pgd, String no_kamar_pgd,
      String judul_pgd, String isi_pgd, String lampiran) async {
    Uri url = Uri.parse("http://sikostan.my.id/api/Pengaduan");
    var hasilRedponse = await http.post(url, body: {
      "nama_pgd": nama_pgd,
      "no_kamar_pgd": no_kamar_pgd,
      "judul_pgd": judul_pgd,
      "isi_pgd": isi_pgd,
      "lampiran": lampiran,
    });
    var data = json.decode(hasilRedponse.body);

    return PostPengduan(
        id: data["id"],
        nama_pgd: data["nama_pgd"],
        no_kamar_pgd: data[""],
        judul_pgd: data["judul_pgd"],
        lampiran: data["lampiran"],
        isi_pgd: data["isi_pgd"]);
  }
}
