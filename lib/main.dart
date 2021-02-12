import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/product_overview.dart';
import './screens/product_detail_screen.dart';
import './providers/products_providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Shop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
