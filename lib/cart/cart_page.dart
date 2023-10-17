import 'package:flutter/material.dart';
import 'package:plantsatu/data/cart_data.dart';
import 'package:plantsatu/pages/detail/detail_page.dart';
import 'package:plantsatu/pages/home/home_page.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart-page';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xBF499E70),
        title: Center(
          child: Text(
            'Cart',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: cartData.length,
          itemBuilder: (context, index) {
            var data = cartData[index];
            return CartTile(
              cData: data,
            );
          }),
    );
  }
}

class CartTile extends StatelessWidget {
  CartTile({
    super.key,
    required this.cData,
  });

  final CartData cData;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(cData.toString()),
      onDismissed: (direction) => cartData.remove(cData),
      child: GestureDetector(
        onTap: () => Navigator.pushNamedAndRemoveUntil(
          context,
          DetailPage.routeName,
          (route) => route.isFirst,
          arguments: cData.model
        ),
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
                child: Image.asset(
                 cData.model.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cData.model.title,
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                        'Jumlah pesan : ${cData.count}',
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
                        'Total ${cData.count * cData.model.price}',
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
