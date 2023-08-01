import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/screens/personal_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../screens/main_screen.dart';
import '../screens/otp/qr_scanner_screen.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        MainScreen(),
        MainScreen(),
        const QRViewExample(),
        MainScreen(),
        MyAccountScreen.myAccount(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          textStyle: styleTitleItem,
          //Button Active
          activeColorPrimary: AppColors.buttonColor,
          inactiveColorPrimary: AppColors.dButoonInActive,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.bookmark),
          title: ("LogBook"),
          textStyle: styleTitleItem,
          //Button Active
          activeColorPrimary: AppColors.buttonColor,
          inactiveColorPrimary: AppColors.dButoonInActive,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.qr_code,
            color: Colors.white,
          ),
          //Button Active
          activeColorPrimary: AppColors.buttonColor,
          inactiveColorPrimary: AppColors.dButoonInActive,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.date_range_rounded),
          title: ("Lịch Làm Việc"),
          textStyle: styleTitleItem,
          //Button Active
          activeColorPrimary: AppColors.buttonColor,
          inactiveColorPrimary: AppColors.dButoonInActive,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: ("Tài Khoản"),
          textStyle: styleTitleItem,
          //Button Active
          activeColorPrimary: AppColors.buttonColor,
          inactiveColorPrimary: AppColors.dButoonInActive,
        ),
      ];
    }

    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
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
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
