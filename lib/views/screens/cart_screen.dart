import 'package:flutter/material.dart';
import 'package:lesson64_statemanagement/controllers/cart_controller.dart';
import 'package:lesson64_statemanagement/models/product.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Savatcha"),
      ),
      body: cartController.cart.products.isEmpty
          ? const Center(
              child: Text("Savatcha bo'sh, mahsulot qo'shing"),
            )
          : ListView.builder(
              itemCount: cartController.cart.products.length,
              itemBuilder: (ctx, index) {
                final product = cartController.cart.products.values.toList()[index]['product'];
                return ProductItem(product: product);
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(),
        onPressed: () {},
        label: Text(
          "\$${cartController.cart.totalPrice}",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
