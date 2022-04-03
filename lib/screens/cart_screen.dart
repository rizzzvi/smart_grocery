import 'package:flutter/material.dart';
import 'package:smart_grocery/screens/routes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [Icon(Icons.shopping_cart), Text('My Cart')],
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 40,
            child: Text('Items(9)'),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            child: Image.network(
                                'https://cdn.metro-online.pk/dashboard/prod-pic/LHE-01262/12620038-0-M.jpg?5'),
                          ),
                          SizedBox(width: 10),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('A dozen appples'),
                                SizedBox(height: 6),
                                Text('10 SR'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
          SizedBox(height: 10),
          Divider(),
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            minVerticalPadding: 0.0,
            title: Text('Total'),
            trailing: Text('20 SR'),
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
