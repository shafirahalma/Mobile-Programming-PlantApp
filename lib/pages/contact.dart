import 'package:flutter/material.dart';
import 'package:plantsatu/data/cart_data.dart';
import 'package:plantsatu/pages/detail/detail_page.dart';
import 'package:plantsatu/pages/home/home_page.dart';

class ContactPage extends StatefulWidget {
  static const String routeName = '/contact-page';

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            backgroundColor: Color(0xFF499E70),
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    SizedBox(height: constraints.maxHeight / 5),
                    Text(
                      'Contact Me',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 253, 253, 253),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.phone,
                          color: Colors.black,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                SizedBox(height: 50),
                buildContactRow(
                  "Address:",
                  Icons.location_on,
                  "Jln Sunan Kalijaga Malang",
                ),
                buildContactRow("Phone:", Icons.phone, "085648183191"),
                buildContactRow("Email:", Icons.email, "plant_app@gmail.com"),
                buildContactRow("Web:", Icons.language, "www.plantapp.com"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContactRow(String title, IconData icon, String content) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(width: 8),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ContactPage(),
  ));
}
