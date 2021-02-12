import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String price;

  ProductItem(this.id, this.title, this.imageUrl, this.price);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, ProductDetailScreen.routeName,
                  arguments: id);
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            leading: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
            backgroundColor: Colors.black87,
            title: Text(
              '₦ $price',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
            ),
          ),
          header: GridTileBar(
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
