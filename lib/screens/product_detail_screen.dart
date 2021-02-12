import 'package:flutter/material.dart';
import 'package:shop/screens/product_overview.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;
  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Shop"),
        centerTitle: true,
      ),
    );
  }
}
