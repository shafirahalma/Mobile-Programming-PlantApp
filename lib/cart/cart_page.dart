import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantsatu/components/bottom_bar.dart';
import 'package:plantsatu/data/cart_data.dart';
import 'package:plantsatu/pages/detail/detail_page.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatefulWidget {
  static const String routeName = '/cart-page';
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  var cartData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String uuid = '';

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      uuid = user.uid;
    }

    final response = await http.get(
      Uri.parse(
          'https://plantaapp-91041-default-rtdb.asia-southeast1.firebasedatabase.app/cart.json'),
    );
 
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      data.forEach((key, value) {
        var uuidDB = value['uuid'];
        if (uuidDB != null && uuidDB == uuid) {
          value['key'] = key;
          cartData.add(value);
        }
      });
      setState(() {});
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xBF499E70),
        title: Center(
          child: Text(
            'Cart',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BottomBar()));
          },
        ),
      ),
      body: ListView.builder(
        itemCount: cartData.length,
        itemBuilder: (context, index) {
          final data = cartData[index];
          return CartTile(
            cData: data,
          );
        },
      ),
    );
  }
}

class CartTile extends StatelessWidget {
  CartTile({
    super.key,
    required this.cData,
  });

  final dynamic cData;

  @override
  Widget build(BuildContext context) {
    Cart cart = new Cart();
    return Dismissible(
      key: Key(cData['key']),
      onDismissed: (direction) => cart.removeCart(cData['key']),
      child: GestureDetector(
        onTap: () => Navigator.pushNamedAndRemoveUntil(
            context, DetailPage.routeName, (route) => route.isFirst,
            arguments: cData),
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          elevation: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 2.7,
                child: Image.network(
                  cData['image'],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cData['title'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color(0xBF499E70),
                        border: Border.all(
                          color: Color(0xBF499E70),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Jumlah pesan : ${cData['count']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(
                          color: Colors.amber,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        // 'Total ${cData.count * cData.model.price}',
                        'Total : \$${cData['count'] * int.parse(cData['price'])}',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
