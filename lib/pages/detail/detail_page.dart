import 'package:flutter/material.dart';
import '../../animations/fade_animation.dart';
import '../../animations/shake_transition.dart';
import 'components/product_count.dart';
import 'package:plantsatu/components/bottom_bar.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = '/detail-page';

  DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic items = ModalRoute.of(context)!.settings.arguments as dynamic;
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
                child: Image.network(
                  items['image'],
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
                        items['title'],
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
                        "\$${items['price']}",
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
                        items['dec'],
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
                child: ProductCount(model: items),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: ListTile(
                leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(BottomBar.routeName);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
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
