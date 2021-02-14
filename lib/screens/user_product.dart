import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_providers.dart';
import '../widgets/main_drawer.dart';

import '../providers/products_providers.dart';
import '../widgets/user_product_item.dart';

class UserProducts extends StatelessWidget {
  static const routeName = '/user-product';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProviders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: () {})],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: (_, index) => Column(
                  children: [
                    UserProductItem(
                      title: productData.items[index].title,
                      imageUrl: productData.items[index].imageUrl,
                    ),
                    Divider(),
                  ],
                )),
      ),
    );
  }
}
