import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_providers.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    final productsContainer =
        Provider.of<ProductProviders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Shop"),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                if (selectedValue == FilterOptions.Favorites) {
                  setState(() {
                    _showOnlyFavourites = true;
                  });
                  //  Show favourites
                } else {
                  //  show all products
                  setState(() {
                    _showOnlyFavourites = false;
                  });
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Only Favourite'),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.All,
                    ),
                  ])
        ],
        centerTitle: true,
      ),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
