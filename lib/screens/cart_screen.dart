import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_grocery/constants/data_provider.dart';
import 'package:smart_grocery/screens/routes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Icon(Icons.shopping_cart),
            Text('My Cart'),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Provider.of<DataProvider>(context, listen: false).clearCart();
              Navigator.of(context).pushNamed(Routes.scannerScreen);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 24.0),
              child: Text('Clear Cart'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 40,
            child: Text(
              'Items - ' +
                  Provider.of<DataProvider>(context, listen: false)
                      .numberOfItems
                      .toString(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Provider.of<DataProvider>(context, listen: false)
                  .cartItems
                  .length,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Provider.of<DataProvider>(context, listen: false)
                              .cartItems[index]['title'],
                        ),
                        SizedBox(height: 6),
                        Text(Provider.of<DataProvider>(context, listen: false)
                                .cartItems[index]['price']
                                .toString() +
                            ' Sr'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Divider(),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            minVerticalPadding: 0.0,
            title: Text('Total'),
            trailing: Text(
              Provider.of<DataProvider>(context, listen: false)
                      .totalBill
                      .toStringAsFixed(2)
                      .toString() +
                  ' Sr',
            ),
          ),
          Divider(),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.paymentMethodRoute);
              },
              child: Text('Place Order'),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
