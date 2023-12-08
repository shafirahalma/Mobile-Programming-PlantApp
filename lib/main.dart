import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plantsatu/cart/cart_page.dart';
import 'package:plantsatu/pages/contact.dart';
import 'components/bottom_bar.dart';
import 'pages/detail/detail_page.dart';
import 'pages/home/home_page.dart';
import 'pages/welcome/welcome_page.dart';
import 'style/app_style.dart';
import 'pages/profile.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:824649038267:android:fddb61c2a3ed546c26ec9e',
      apiKey: 'AIzaSyA5lTxwLMVNvev66r3WoLZHkbpSdD-tpzo',
      messagingSenderId: '824649038267',
      projectId: 'plantaapp-91041',
    ),
  );

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
        DetailPage.routeName: (context) => DetailPage(),
        BottomBar.routeName: (context) => const BottomBar(),
        CartPage.routeName: (context) => CartPage(),
        ProfilePage.routeName: (context) => ProfilePage(),
        ContactPage.routeName: (context) => ContactPage(),
      },
    );
  }
}
