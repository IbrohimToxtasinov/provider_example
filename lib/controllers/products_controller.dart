import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lesson64_statemanagement/models/product.dart';

class ProductsController extends ChangeNotifier {
  final List<Product> _list = [
    Product(
      id: UniqueKey().toString(),
      title: "iPhone",
      color: Colors.teal,
      price: 340.5,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Macbook",
      color: Colors.grey,
      price: 1340.5,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "AirPods",
      color: Colors.blue,
      price: 140.5,
    ),
  ];

  List<Product> get list {
    return [..._list];
  }

  deleteProduct({required String productId}) {
    _list.removeWhere((element) => element.id == productId);
    notifyListeners();
  }
}
