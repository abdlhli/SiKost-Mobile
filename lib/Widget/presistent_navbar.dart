import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sikost/Screen/Home/home.dart';
import 'package:sikost/Screen/Pembayaran/DetailPembayaran.dart';
import 'package:sikost/Screen/Pembayaran/HistoriPembayaran.dart';
import 'package:sikost/Screen/penghuni.dart';
import 'package:sikost/Screen/profile.dart';

class Persistent extends StatelessWidget {
  const Persistent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller = new PersistentTabController();
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const penghuni(),
    const HistoriPembayaran(),
    const home(),
    const DetailPembayaran(),
    const Profile(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.person_2),
      title: ("Penghuni"),
      activeColorPrimary: const Color.fromRGBO(0, 122, 255, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.paperclip),
      title: ("Histori Pembayaran"),
      activeColorPrimary: const Color.fromRGBO(0, 122, 255, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: const Color.fromRGBO(0, 122, 255, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.money_dollar_circle),
      title: ("Detail Pembayaran"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.profile_circled),
      title: ("Profile"),
      activeColorPrimary: const Color.fromRGBO(0, 122, 255, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
