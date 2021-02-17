import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './edit_product.dart';
import '../providers/products_providers.dart';
import '../widgets/main_drawer.dart';

import '../widgets/user_product_item.dart';

class UserProducts extends StatelessWidget {
  static const routeName = '/user-product';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<ProductProviders>(context, listen: false)
        .fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    // final productData = Provider.of<ProductProviders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProduct.routeName);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () => _refreshProducts(context),
                child: Consumer<ProductProviders>(
                  builder: (ctx, productData, _) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: productData.items.length,
                        itemBuilder: (_, index) => Column(
                              children: [
                                UserProductItem(
                                  title: productData.items[index].title,
                                  imageUrl: productData.items[index].imageUrl,
                                  id: productData.items[index].id,
                                ),
                                Divider(),
                              ],
                            )),
                  ),
                ),
              ),
      ),
    );
  }
}
