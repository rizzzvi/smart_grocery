import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_grocery/screens/routes.dart';
import 'package:smart_grocery/services/authentication_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   checkSession();
  // }

  // const SplashScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    checkSession();
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/cart2.svg',
              color: Theme.of(context).primaryColor,
              height: 60,
              width: 60,
            ),
            SizedBox(height: 10),
            Text(
              'Smart Grocery',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }

  void checkSession() async {
    Future.delayed(
      Duration(
        seconds: 1,
      ),
      () async {
        bool isLoggedIn = await AuthenticationHelper().isUserLoggedIn();
        if (isLoggedIn) {
          Navigator.of(context).pushReplacementNamed(Routes.scannerScreen);
        } else {
          Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
        }
      },
    );
  }
}
