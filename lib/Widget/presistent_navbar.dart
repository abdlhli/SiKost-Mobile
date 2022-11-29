import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.widget.dart';
import 'package:sikost/Screen/Home/home.dart';
import 'package:sikost/Screen/Pembayaran/DetailPembayaran.dart';
import 'package:sikost/Screen/Pembayaran/HistoriPembayaran.dart';
import 'package:sikost/Screen/penghuni.dart';
import 'package:sikost/Screen/profile.dart';

class Persistent extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

   PersistentTabController _controller = new PersistentTabController();
    return PersistentTabView(
      
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
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
    penghuni(),
    HistoriPembayaran(),
    home(),
    DetailPembayaran(),
    Profile(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
     PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.person_2),
      title: ("Penghuni"),
      activeColorPrimary: Color.fromRGBO(0, 122, 255, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
     PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.paperclip),
      title: ("Histori Pembayaran"),
      activeColorPrimary: Color.fromRGBO(0, 122, 255, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: Color.fromRGBO(0, 122, 255, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.money_dollar_circle),
      title: ("Detail Pembayaran"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
     PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: ("Profile"),
      activeColorPrimary: Color.fromRGBO(0, 122, 255, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
