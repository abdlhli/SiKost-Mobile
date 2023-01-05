import 'package:flutter/material.dart';
import 'package:sikost/Widget/presistent_navbar.dart';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class listBarang extends StatefulWidget {
  const listBarang({Key? key}) : super(key: key);

  @override
  State<listBarang> createState() => _listBarangState();
}

class _listBarangState extends State<listBarang> {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
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
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Persistent()));
                },
                icon: const Icon(Icons.arrow_back_ios_new),
                color: Colors.blue.shade900,
              ),
              title: const Text(
                "Daftar Harga Barang Tambahan",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "1. Computer : Rp 40.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "2. Televisi : Rp 25.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "3. Kipas Angin : Rp 25.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "4. Hair Dryer : Rp 25.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "5. Dispenser : Rp 50.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "6. Oven Listrik : Rp 50.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "7. Kompor Listrik : Rp 50.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "8. Bread Toaster : Rp 25.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "9. Juicer : Rp 25.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "10. Coffee Maker : Rp 25.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "11. Mixer : Rp 25.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "12. Mug Air : Rp 40.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "13. Setrika : Rp 30.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "14. Kulkas : Rp 35.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "15. Microwave : Rp 50.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "16. Vacuum Cleaner : Rp 50.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "17. Mesin Cuci : Rp 45.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
                                    const Text(
                                      "18. Alat Music Listrik : Rp 40.000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 5)),
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
