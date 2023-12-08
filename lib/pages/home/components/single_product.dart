import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../detail/detail_page.dart';
import 'package:http/http.dart' as http;

class SingleProduct extends StatefulWidget {
  const SingleProduct({Key? key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct>
    with TickerProviderStateMixin {
  var items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://restapifirebase-cc393-default-rtdb.firebaseio.com/detailpage.json',
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        data.forEach((key, value) {
          items.add(value);
        });

        setState(() {
          isLoading = false;
        });
      } else {
        throw Exception(
            'Gagal mengambil data. Kode status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 655,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                padding: const EdgeInsets.only(left: 23, right: 23),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemCount: items.length, //8
                itemBuilder: (context, index) {
                  final item = items[index];
                  return CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        DetailPage.routeName,
                        (route) => route.isFirst,
                        arguments: item,
                      );
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 13, right: 14, top: 17),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 213, 224, 208),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              item['image'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Text('Gagal memuat gambar');
                              },
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              item['title'],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "\$${item['price']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                              ),
                            ),
                            trailing: CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              child: const Icon(
                                Icons.favorite_rounded,
                                color: Color.fromARGB(255, 232, 46, 46),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}



























// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../../data/data.dart';
// import '../../../style/app_style.dart';
// import '../../detail/detail_page.dart';

// class SingleProduct extends StatefulWidget {
//   final ProductModel productModel;
//   const SingleProduct({super.key, required this.productModel});
//   @override
//   State<SingleProduct> createState() => _SingleProductState();
// }

// class _SingleProductState extends State<SingleProduct>
//     with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoButton(
//       padding: EdgeInsets.zero,
//       onPressed: () {
//         Navigator.pushNamedAndRemoveUntil(
//           context,
//           DetailPage.routeName,
//           (route) => route.isFirst,
//           arguments: widget.productModel,
//         );
//       },
//       child: Container(
//         padding: const EdgeInsets.only(left: 13, right: 14, top: 17),
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 213, 224, 208),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage(
//                       widget.productModel.image,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             ListTile(
//               contentPadding: EdgeInsets.zero,
//               title: Text(
//                 widget.productModel.title,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               subtitle: Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Text(
//                   "\$${widget.productModel.price}",
//                   style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                       ),
//                 ),
//               ),
//               trailing: CupertinoButton(
//                 padding: EdgeInsets.zero,
//                 onPressed: () {},
//                 child: const Icon(
//                   Icons.favorite_rounded,
//                   color: Color.fromARGB(255, 232, 46, 46),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





