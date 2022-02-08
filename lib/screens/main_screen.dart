import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_grocery/screens/routes.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/cart2.svg',
                    color: Theme.of(context).primaryColor,
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(height: 00),
                  Text(
                    'PMU',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Grocery Store',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.signupRoute);
                      },
                      child: Text('Create Account')),
                ),
                SizedBox(width: 40),
                Container(
                  width: 140,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.loginRoute);
                      },
                      child: Text('Login')),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
