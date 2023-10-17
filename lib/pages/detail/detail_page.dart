import 'package:flutter/material.dart';
import '../../animations/fade_animation.dart';
import '../../animations/shake_transition.dart';
import '../../data/data.dart';
import '../../style/app_style.dart';
import 'components/product_count.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = '/detail-page';

  DetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    Size size = MediaQuery.of(context).size;
    double imageHeight = size.height * 0.6;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Image Area ..
            Container(
              height: imageHeight,
              width: size.width,
              child: FadeAnimation(
                child: Image.asset(
                  productModel.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// Details Area..
            ShakeTransition(
              axis: Axis.vertical,
              child: Container(
                width: size.width,
                height: size.height * 0.50,
                margin: EdgeInsets.only(top: size.height * 0.50, bottom: 70),
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  children: [
                    ShakeTransition(
                      axis: Axis.vertical,
                      child: Text(
                        productModel.title,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ShakeTransition(
                      axis: Axis.vertical,
                      child: Text(
                        "\$${productModel.price}",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 69, 158, 34),
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        4,
                        (index) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 26,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ShakeTransition(
                      axis: Axis.vertical,
                      child: Text(
                        productModel!.dec,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: const Color(0xff555050),
                              height: 1.5,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.bottomCenter,
              child: ShakeTransition(
                child: ProductCount(model: productModel),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: const ListTile(
                leading: BackButton(),
                trailing: Icon(
                  Icons.favorite_rounded,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
