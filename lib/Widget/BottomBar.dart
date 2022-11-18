import 'package:flutter/material.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:sikost/Screen/Pembayaran/DetailPembayaran.dart';
import 'package:sikost/Screen/Pembayaran/HistoriPembayaran.dart';
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
      bottomNavigationBar: BottomBarBubble(
        color: Colors.blue.shade600,
        items: [
          BottomBarItem(
            iconData: Icons.home,
          ),
          BottomBarItem(
            iconData: Icons.receipt_long_rounded,
          ),
          BottomBarItem(
            iconData: Icons.people_rounded,
          ),
          BottomBarItem(
            iconData: Icons.report_problem_rounded,
          ),
          BottomBarItem(
            iconData: Icons.person_rounded,
          ),
        ],
        selectedIndex: 0,
        onSelect: (index) {
          controller.jumpToPage(index);
        },
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
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
