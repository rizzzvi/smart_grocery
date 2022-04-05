import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_grocery/constants/data_provider.dart';
import 'package:smart_grocery/screens/routes.dart';

class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              'Select a payment method',
              style:
                  Theme.of(context).textTheme.headline2?.copyWith(fontSize: 28),
            ),
            SizedBox(height: 50),
            Container(
              height: 100,
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.grey[300],
              child: Text(
                'Cash',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: Colors.black),
              ),
            ),
            SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.paymentDetailsRoute);
              },
              child: Container(
                height: 100,
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.grey[300],
                child: Text(
                  'Card',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.075,
            ),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    Provider.of<DataProvider>(context, listen: false)
                            .totalBill
                            .toString() +
                        ' Sr',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
