import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plantsatu/data/data.dart';

class Cart {
  Future<dynamic> addCart(dynamic model, int productCount) async {
    String uuid = '';
    final dio = Dio();

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      uuid = user.uid;
    }

    try {
      final response = await dio.post(
        'https://plantaapp-91041-default-rtdb.asia-southeast1.firebasedatabase.app/cart.json',
        data: {
          'uuid': uuid,
          'id': model['id'],
          'title': model['title'],
          'dec': model['dec'],
          'price': model['price'],
          'count': productCount,
          'image': model['image'],
        },
      );

      if (response.statusCode == 200) {
        print('Cart berhasil ditambahkan');
      } else {
        print('Gagal menambahkan cart: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan saat mengirim permintaan: $e');
    }
  }

  Future<void> removeCart(String cartKey) async {
    final dio = Dio();

    try {
      final response = await dio.delete(
        'https://plantaapp-91041-default-rtdb.asia-southeast1.firebasedatabase.app/cart/$cartKey.json',
      );

      if (response.statusCode == 200) {
        print('Cart item berhasil dihapus');
      } else {
        print('Gagal menghapus cart item: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan saat mengirim permintaan: $e');
    }
  }
}



// import 'package:plantsatu/data/data.dart';

// class CartData {
//   ProductModel model;
//   int count;

//   CartData({required this.model, required this.count});
// }

// List<CartData> cartData = [];