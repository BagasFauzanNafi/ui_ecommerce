import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/cart.dart';

import '../model/products.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _listCart = [

  ];

  List<Cart> get cartItems => _listCart;

  void removeCartItem(Cart cartItem) {
    _listCart.removeWhere((item) => item.product.id == cartItem.product.id);
    notifyListeners();
  }

  void addCartItem(Cart cartItem) {
    final index =
        _listCart.indexWhere((item) => item.product.id == cartItem.product.id);

    if (index != -1) {
      _listCart[index].numOfItem += cartItem.numOfItem;
    } else {
      _listCart.add(cartItem);
    }
    notifyListeners();
  }

//   final List<Cart> _cartItems = listCart;

//   List<Cart> get cartItems => _cartItems;

//   int get totalItems => _cartItems.length;
// // agar 2 angka dibelakang koma tidak lebih dari 2 dan di bulatkan
  double get totalPrice => double.parse(
        _listCart
            .fold(
                0.0,
                (double total, current) =>
                    total + current.product.price * current.numOfItem)
            .toStringAsFixed(2),
      );

//   void addCartItem(Cart cartItem) {
//     // Cari index item di _cartItems berdasarPkan ID produk
//     final index =
//         _cartItems.indexWhere((item) => item.product.id == cartItem.product.id);

//     if (index != -1) {
//       // Jika item sudah ada, tambahkan jumlahnya
//       _cartItems[index].numOfItem += cartItem.numOfItem;
//     } else {
//       // Jika item belum ada, tambahkan ke daftar
//       _cartItems.add(cartItem);
//     }

//     print(
//         "Cart Items: ${_cartItems.map((item) => '${item.product.title}: ${item.numOfItem}').toList()}");
//     notifyListeners();
//   }

  // void removeCartItem(Cart cartItem) {
  //   _listCart.removeWhere((item) => item.product.id == cartItem.product.id);
  //   notifyListeners();
  // }

  void clearCart() {
    _listCart.clear();
    notifyListeners();
  }
}
