import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sikost/Widget/bawah.dart';
import 'home.dart';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class Rules extends StatefulWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 100),
        child: Column(
          children: [
            AppBar(
              toolbarHeight: 100,
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => NavBawah()));
                },
                icon: const Icon(Icons.arrow_back_ios_new),
                color: Colors.blue.shade900,
              ),
              title: const Text(
                "Peratuan KOST",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              const Color.fromARGB(255, 20, 136, 204),
              const Color.fromARGB(255, 43, 50, 178),
            ],
          )),
        ),
        Transform.rotate(
          angle: -math.pi / 3.3,
          alignment: Alignment.topLeft,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: const Offset(4, 4))
            ]),
          ),
        ),
        PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            pageSnapping: true,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 25),
                  width: 320,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(231, 125, 125, 125),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ],
                    border: Border.all(
                      color: const Color.fromARGB(88, 73, 74, 77),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text("Jawa Kost Putri - 48",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                          children: <Widget>[
                            Container(
                              height: 515,
                              color: Colors.blue.shade700,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '1. Kost ini di khususkan untuk putri.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '2. Uang sewa dibayar setiap tahun, dilakukan pad awal kost/kontrak.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '3. Ruang tamu laki laki di teras, untuk tamu perempuan didalam.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '4. Jam berkunjung untuk tamu mulai 06.00-21.00.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '5. Tamu tidak diijinkan menginap (meliputi teman,keluarga,dsb).',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '6. Dilarang membawa, menyimpan, memakai, mengedarkan: rokok, minuman keras/beralkohol, narkotika, dan obat terlarang.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '7. Tidak diperkenankan membawa binatang peliharaan selain ikan hias dan binatang untuk keperluan praktikum.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '8. Fasilitas yang tersedia hanya diperuntukkan baagi penghuni kost.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '9. Tidak boleh membawa alat alat elektronik selain HP, lampu tidur, kipas angin kecil, magic com, laptop, kecuali bagi yang membayar biaya tambahan.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 25),
                  width: 320,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(231, 125, 125, 125),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ],
                    border: Border.all(
                      color: const Color.fromARGB(88, 73, 74, 77),
                    ),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text("Jawa Kost Putri - 48",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                          children: <Widget>[
                            Container(
                              height: 515,
                              color: Colors.blue.shade700,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '10. Bila membawa alat elektronik selain yang disebutkan pada butir no. 9, akan dikenai biaya tambahan.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '11. Lampu di dalam kamar dan kamar mandi apabila mati menjadi tanggungan penghuni kost/penyewa kamar untuk mengganti.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '12. Harap menyetrika baju ditempat yang telah disediakan dan menjemur cucian di lantai jemur lantai 3.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '13. Harap berpakaian sopan.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '14. Harap menjaga kebersihan seluruh rumah meliputi halaman, dapur dan peralatannya, kamar tidur, kamar mandi/wc, semua ruangan baik yang di dalam maupun di luar rumah.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '15. Dilarang membuang sampah sembarangan, tidak mencorat-coret dinding, tidak menempelkan apapun di dinding(paku, kertas, lukisan, hiasan apapun dsb secara berlebihan).',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 25),
                  width: 320,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(231, 125, 125, 125),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ],
                    border: Border.all(
                      color: const Color.fromARGB(88, 73, 74, 77),
                    ),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text("Jawa Kost Putri - 48",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                          children: <Widget>[
                            Container(
                              height: 515,
                              color: Colors.blue.shade700,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '16. Dilarang menaruh keranjang sampah, sampah organic, peralatan makan dan masak bekas pakai diluar kamar. Sampah harap dibuang di tong sampah besar dekat gerbang. Apabila terdapat pelanggaran maka pemilik kost berhak membuang property tersebut secara sepihak tanpa pemberitahuan.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '17. Tidak meludah sembarangan, tidak membuang pembalut di wc.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '18. Harap matikan keran air dan lampu-lampu, apabila tidak diperlukan.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '19. Harap menghormati privasi antar teman dan tetangga. (Tidak memasuki kamar orang lain tanpa seizin penghuninya, tidak menggunakan barang milik orang lain seenaknya, tidak membuat keributan dengan berbagai cara, tidak menggangu teman dan tetangga, tidak melanggar norma hukum, etika, dan asusila, dst).',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 25),
                  width: 320,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(231, 125, 125, 125),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ],
                    border: Border.all(
                      color: const Color.fromARGB(88, 73, 74, 77),
                    ),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text("Jawa Kost Putri - 48",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                          children: <Widget>[
                            Container(
                              height: 515,
                              color: Colors.blue.shade700,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '20. Penyewa akan dipinjami kunci kamar dan pagar. Apabila pergi, pintu kamar dan pagar harap dikunci. Setelah masa sewa berakhir, maka penyewa harus mengembalikan kunci kamar dan pagar.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '21. Pembayaran isi gas LPG, kerusakan lampu dalam kamar dan kamar mandi, ditanggung oleh penghuni kost.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '22. Harap tidak menyimpan barang berharga.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '23. Harap memarkir sepeda/sepeda motor ditempat parkir yang telah disediakan dengan tertib dan teratur. Kendaraan yang diparkir harap dikunci seetir.kunci ganda demi keamanan.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      '24. Apabila terjadi pelanggaran peraturan dan tata tertib, maka pemilik kost berhak mengeluarkan penyewa kamar.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ]),
    );
  }
}

void showAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text('Geser untuk selengkapnya!'),
    ),
  );
}
