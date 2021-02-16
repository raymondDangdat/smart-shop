import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/product_overview.dart';
import './providers/auth.dart';
import './screens/edit_product.dart';
import './providers/orders.dart';
import './screens/user_product.dart';
import './providers/cart.dart';
import './screens/product_detail_screen.dart';
import './providers/products_providers.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Auth()),
          ChangeNotifierProvider(
            create: (ctx) => ProductProviders(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Cart(),
          ),
          ChangeNotifierProvider(create: (ctx) => Orders()),
        ],
        child: Consumer<Auth>(
          builder: (
            ctx,
            auth,
            _,
          ) =>
              MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SmartShop',
            theme: ThemeData(
                primarySwatch: Colors.purple,
                accentColor: Colors.deepOrange,
                fontFamily: 'Lato'),
            home: auth.isAuth ? ProductOverviewScreen() : AuthScreen(),
            routes: {
              ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
              CartScreen.routeName: (context) => CartScreen(),
              OrderScreen.routeName: (context) => OrderScreen(),
              UserProducts.routeName: (context) => UserProducts(),
              EditProduct.routeName: (context) => EditProduct(),
              // ProductOverviewScreen.routeName: (context) => ProducProductOverviewScreen(),
            },
          ),
        ));
  }
}
