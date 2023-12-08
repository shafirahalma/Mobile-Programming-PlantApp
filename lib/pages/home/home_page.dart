import 'package:flutter/material.dart';
import 'components/discover_profile.dart';
import 'components/single_product.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home-page';
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [const DiscoverAndProfile(), const SingleProduct()],
        ),
      ),
    );
  }
}



















// import 'package:flutter/material.dart';
// import '../../data/data.dart';
// import 'components/discover_profile.dart';
// import 'components/single_product.dart';

// class HomePage extends StatelessWidget {
//   static const String routeName = '/home-page';
//   const HomePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             const DiscoverAndProfile(),
//             SliverPadding(
//               padding: const EdgeInsets.only(left: 23, right: 23, top: 26),
//               sliver: SliverGrid(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 24,
//                   crossAxisSpacing: 20,
//                   childAspectRatio: 0.7,
//                 ),
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                     ProductModel productModel = productList[index];
//                     return SingleProduct(productModel: productModel);
//                   },
//                   childCount: productList.length,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


