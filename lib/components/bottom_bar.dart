import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plantsatu/cart/cart_page.dart';
import 'package:plantsatu/pages/profile.dart';
import '../pages/home/home_page.dart';
import '../style/app_style.dart';
import 'package:plantsatu/pages/contact.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottom-bar';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CartPage(),
    ProfilePage(),
    ContactPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xBF499E70),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppStyle.homeIcon,
              colorFilter: const ColorFilter.mode(
                AppStyle.kIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              AppStyle.homeIcon,
              colorFilter: const ColorFilter.mode(
                AppStyle.primarySwatch,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppStyle.cartIcon),
            activeIcon: SvgPicture.asset(
              AppStyle.cartIcon,
              colorFilter: const ColorFilter.mode(
                AppStyle.primarySwatch,
                BlendMode.srcIn,
              ),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppStyle.profileIcon),
            activeIcon: SvgPicture.asset(
              AppStyle.profileIcon,
              colorFilter: const ColorFilter.mode(
                AppStyle.primarySwatch,
                BlendMode.srcIn,
              ),
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppStyle.contactIcon),
            activeIcon: SvgPicture.asset(
              AppStyle.contactIcon,
              colorFilter: const ColorFilter.mode(
                AppStyle.primarySwatch,
                BlendMode.srcIn,
              ),
            ),
            label: 'Contact',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppStyle.primarySwatch,
        unselectedItemColor: AppStyle.kIconColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
