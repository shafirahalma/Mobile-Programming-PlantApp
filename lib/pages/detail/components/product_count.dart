import 'package:flutter/material.dart';
import 'package:plantsatu/cart/cart_page.dart';
import 'package:plantsatu/data/cart_data.dart';

import '../../../style/app_style.dart';

class ProductCount extends StatefulWidget {
  dynamic model;
  ProductCount({required this.model, super.key});

  @override
  _ProductCountState createState() => _ProductCountState();
}

class _ProductCountState extends State<ProductCount> {
  int productCount = 1;

  void incrementCount() {
    setState(() {
      productCount++;
    });
  }

  void decrementCount() {
    setState(() {
      if (productCount > 1) {
        productCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: AppStyle.kIconColor,
              onPressed: decrementCount,
              child: const Icon(Icons.remove, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                productCount.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            FloatingActionButton.small(
              onPressed: incrementCount,
              heroTag: null,
              child: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Cart cart = new Cart();
              cart.addCart(widget.model, productCount);
              // cartData.add(CartData(model: widget.model, count: productCount));
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Produk Ditambahkan"),
                    content:
                        Text("Produk telah berhasil ditambahkan ke keranjang."),
                    actions: <Widget>[
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(CartPage.routeName);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              "Add to Cart",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}