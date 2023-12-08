import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../animations/fade_animation.dart';
import '../../../style/app_style.dart';

class DiscoverAndProfile extends StatelessWidget {
  const DiscoverAndProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(
            "Paradise Of Plant",
            style: TextStyle(
              color: Color(0xBF499E70),
              fontSize: 34,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: -0.68,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Produk",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
