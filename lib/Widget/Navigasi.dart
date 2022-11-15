import 'package:flutter/material.dart';
import '/screen/detailPembayaran.dart';


class Navigasi extends StatefulWidget {
  const Navigasi({Key? key}) : super(key: key);

  @override
  State<Navigasi> createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  int _selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;

      //tempat ganti page
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SizedBox(
        height: 50.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                onTabTapped(2);
              },
              icon: const Icon(Icons.home_rounded),
              color: _selectedIndex == 2 ? Colors.grey : Colors.black,
            ),
            IconButton(
              onPressed: () {
                onTabTapped(2);
              },
              icon: const Icon(Icons.receipt_rounded),
              color: _selectedIndex == 2 ? Colors.grey : Colors.black,
            ),
            IconButton(
              onPressed: () {
                onTabTapped(2);
              },
              icon: const Icon(Icons.report_rounded),
              color: _selectedIndex == 2 ? Colors.grey : Colors.black,
            ),
            IconButton(
              onPressed: () {
                onTabTapped(2);
              },
              icon: const Icon(Icons.people_alt_rounded),
              color: _selectedIndex == 2 ? Colors.grey : Colors.black,
            ),
            IconButton(
              onPressed: () {
                onTabTapped(2);
              },
              icon: const Icon(Icons.person_rounded),
              color: _selectedIndex == 2 ? Colors.grey : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
