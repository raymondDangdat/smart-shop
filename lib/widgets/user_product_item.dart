import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/edit_product.dart';
import '../screens/edit_product.dart';
import '../providers/products_providers.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem({this.title, this.imageUrl, this.id});
  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100.0,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProduct.routeName, arguments: id);
              },
              splashColor: Theme.of(context).primaryColor,
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                try {
                  await Provider.of<ProductProviders>(context, listen: false)
                      .deleteProduct(id);
                } catch (error) {
                  scaffold.showSnackBar(SnackBar(
                      content: Text(
                    "Failed to delete!",
                    textAlign: TextAlign.center,
                  )));
                }
              },
              splashColor: Theme.of(context).accentColor,
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
