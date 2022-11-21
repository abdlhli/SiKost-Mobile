import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:sikost/Screen/DetailPembayaran.dart';
import 'package:sikost/Screen/HistoriPembayaran.dart';
import 'login.dart';
import 'package:sikost/Screen/Home/home.dart';
import 'package:sikost/Screen/profile.dart';
import 'package:sikost/Screen/register.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  TextStyle style = TextStyle(
    fontSize: 12,
  );

  int selectedPage = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [
          Register(),
          HistoriPembayaran(),
          home(),
          DetailPembayaran(),
          Profile(),
        ][selectedPage],
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(icon: Icons.people, title: 'Penghuni'),
            TabItem(icon: Icons.book_rounded, title: 'Riwayat'),
            TabItem(
              icon: Icons.home,
              title: 'Home',
            ),
            TabItem(icon: Icons.message, title: 'Pesan'),
            TabItem(icon: Icons.people, title: 'Profil'),
          ],
          backgroundColor: Colors.white,
          color: Color.fromARGB(255, 128, 128, 128),
          activeColor: Color.fromARGB(255, 20, 136, 204),
          initialActiveIndex: 2,
          onTap: (int i) {
            setState(() {
              selectedPage = i;
            });
          },
        ));
  }
}
