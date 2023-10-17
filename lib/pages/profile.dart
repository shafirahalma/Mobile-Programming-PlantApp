import 'package:flutter/material.dart';
import 'package:plantsatu/pages/detail/detail_page.dart';
import 'package:plantsatu/pages/home/home_page.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile-page';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xBF499E70),
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 125,
                width: 125,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.only(right: 250),
                child: const Text(
                  "Nama",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: const TextStyle(
                  fontFamily: 'Poppins Light',
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Shafira Halmahera",
                  hintText: "Ubah Nama",
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(right: 265),
                child: const Text(
                  "NIM",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: const TextStyle(
                  fontFamily: 'Poppins Light',
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "210605110008",
                  hintText: "Ubah NIM",
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(right: 255),
                child: const Text(
                  "Kelas",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                style: const TextStyle(
                  fontFamily: 'Poppins Light',
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Pemrograman Mobile D",
                  hintText: "Ubah Kelas",
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
