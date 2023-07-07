// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// class BottomNav extends StatelessWidget {
//   const BottomNav({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _buildScreens() {
//       return [];
//     }

//     List<PersistentBottomNavBarItem> _navBarsItems() {
//       return [
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.home),
//           title: ("Home"),
//           textStyle: dStyleTexNav,
//           activeColorPrimary: dButoonActive,
//           inactiveColorPrimary: dButoonInActive,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.bookmark),
//           title: ("LogBook"),
//           textStyle: dStyleTexNav,
//           activeColorPrimary: dButoonActive,
//           inactiveColorPrimary: dButoonInActive,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(
//             Icons.qr_code,
//             color: Colors.white,
//           ),
//           activeColorPrimary: dButoonActive,
//           inactiveColorPrimary: dButoonInActive,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.date_range_rounded),
//           title: ("Lịch Làm Việc"),
//           textStyle: dStyleTexNav,
//           activeColorPrimary: dButoonActive,
//           inactiveColorPrimary: dButoonInActive,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.person),
//           title: ("Tài Khoản"),
//           textStyle: dStyleTexNav,
//           activeColorPrimary: dButoonActive,
//           inactiveColorPrimary: dButoonInActive,
//         ),
//       ];
//     }

//     PersistentTabController controller;

//     controller = PersistentTabController(initialIndex: 0);
//     return PersistentTabView(
//       context,
//       controller: controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Colors.white, // Default is Colors.white.
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset:
//           true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardShows:
//           true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         colorBehindNavBar: Colors.white,
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: const ItemAnimationProperties(
//         // Navigation Bar's items animation properties.
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: const ScreenTransitionAnimation(
//         // Screen transition animation on change of selected tab.
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 200),
//       ),
//       navBarStyle:
//           NavBarStyle.style15, // Choose the nav bar style with this property.
//     );
//   }
// }

