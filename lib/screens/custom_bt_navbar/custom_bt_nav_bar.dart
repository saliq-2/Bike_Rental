import 'package:e_commerce_full/screens/cartscreen/cart_screen.dart';
import 'package:e_commerce_full/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../userprofile/user_profile.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({ final Key? key})
      : super(key: key);


  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  late PersistentTabController _controller=PersistentTabController();
  late bool _hideNavBar=false;


  List<Widget> _buildScreens() => [

    homepage(),cart_screen(),user_profile(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.shopping_cart_outlined),
      title: "Cart",
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.grey,

    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: "Profile",
      activeColorPrimary: Colors.blueAccent,
      inactiveColorPrimary: Colors.grey,

    ),

  ];

  @override
  Widget build(final BuildContext context) => Scaffold(

    body: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
          ? 0.0
          : kBottomNavigationBarHeight,
      bottomScreenMargin: 0,
      // onWillPop: (final context) async {
      //   await showDialog(
      //     context: context!,
      //     useSafeArea: true,
      //     builder: (final context) => Container(
      //       height: 50,
      //       width: 50,
      //       color: Colors.white,
      //       child: ElevatedButton(
      //         child: const Text("Close"),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ),
      //   );
      //   return false;
      // },

      backgroundColor: Colors.black,
      hideNavigationBar: _hideNavBar,
      decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      navBarStyle: NavBarStyle
          .style1, // Choose the nav bar style with this property
    ),
  );
}