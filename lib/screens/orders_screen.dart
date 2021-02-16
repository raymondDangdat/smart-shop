import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/main_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Future _ordersFuture;

  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        body: FutureBuilder(
            future: _ordersFuture,
            builder: (ctx, datasnapshot) {
              if (datasnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (datasnapshot.error != null) {
                  //  Handle error stuff
                  return Center(
                    child: Text('An error occured'),
                  );
                } else {
                  return Consumer<Orders>(
                      builder: (ctx, orderData, child) => ListView.builder(
                          itemCount: orderData.orders.length,
                          itemBuilder: (context, index) =>
                              OrderItem(orderData.orders[index])));
                }
              }
            }));
  }
}
