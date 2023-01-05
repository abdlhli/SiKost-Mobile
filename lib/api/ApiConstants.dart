// ignore_for_file: file_names

class ApiConstants {
  static const String baseUrl = "http://192.168.223.153/SiKostan";

  static const String postPemesanan = "/api/Pemesanan.php";
  static const String getKamarKDalam = "/api/Kamar.php?id_jenis_kamar=1";
  static const String getKamarKLuar = "/api/Kamar.php?id_jenis_kamar=2";

  static const String getPhotoProfile = "/file/profile/";
  static const String getPhotoKuitansi = "/file/kuitansi/";

  static const String getPembayaranDeadline =
      "/api/PembayaranJatuhTempo?id_user=";
  static const String getPembayaran = "/api/Pembayaran?id_user=";

  static const String postLogin = "/api/Login.php";

  static const String postPengaduan = "/api/Pengaduan.php";

  static const String getUser = "/api/User.php";

  static const String postRegister = "/api/Register.php";

  static const String postUpdateUser = "/api/Update.php?id_user=";
}
