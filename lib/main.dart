import 'package:flutter/material.dart';
import 'package:plantsatu/cart/cart_page.dart';
import 'components/bottom_bar.dart';
import 'pages/detail/detail_page.dart';
import 'pages/home/home_page.dart';
import 'pages/welcome/welcome_page.dart';
import 'style/app_style.dart';
import 'pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: AppStyle.theme,
      routes: {
        '/': (context) => const WelcomePage(),
        HomePage.routeName: (context) => const HomePage(),
        DetailPage.routeName: (context) =>  DetailPage(),
        BottomBar.routeName: (context) => const BottomBar(),
        CartPage.routeName: (context) => CartPage(),
        ProfilePage.routeName: (context) => ProfilePage(),
      },
    );
  }
}
