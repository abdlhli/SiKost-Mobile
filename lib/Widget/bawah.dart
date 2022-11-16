import 'package:flutter/material.dart';

import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:sikost/Screen/DetailPembayaran.dart';
import 'package:sikost/Screen/HistoriPembayaran.dart';
import 'package:sikost/Screen/home.dart';
import 'package:sikost/Screen/profile.dart';
import 'package:sikost/Screen/register.dart';

class NavBawah extends StatefulWidget {
  @override
  State<NavBawah> createState() => _NavBawahState();
}

class _NavBawahState extends State<NavBawah> {
  final PageController controller = PageController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomBarBubble(
        items: [
          BottomBarItem(
            iconData: Icons.home,
          ),
          BottomBarItem(
            iconData: Icons.chat,
          ),
          BottomBarItem(
            iconData: Icons.notifications,
          ),
          BottomBarItem(
            iconData: Icons.calendar_month,
          ),
          BottomBarItem(
            iconData: Icons.settings,
          ),
        ],
        onSelect: (index) {
          controller.jumpToPage(index);
        },
      ),
      body: PageView(
        controller: controller,
        children: const <Widget>[
          home(),
          DetailPembayaran(),
          HistoriPembayaran(),
          Profile(),
          Register()
        ],
      ),
    );
  }
}
