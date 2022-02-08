import 'package:flutter/material.dart';
import 'package:smart_grocery/screens/login_screen.dart';
import 'package:smart_grocery/screens/main_screen.dart';
import 'package:smart_grocery/screens/payment_confirmation_screen.dart';
import 'package:smart_grocery/screens/payment_details_screen.dart';
import 'package:smart_grocery/screens/payment_method_screen.dart';
import 'package:smart_grocery/screens/routes.dart';
import 'package:smart_grocery/screens/scan_code_screen.dart';
import 'package:smart_grocery/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Grocery',
      theme: ThemeData(
        primaryColor: Colors.green[300],
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.green[300], fontSize: 70, letterSpacing: 12),
          headline3: TextStyle(color: Colors.green[300], fontSize: 20),
          headline2: TextStyle(color: Colors.black, fontSize: 36),
        ),
      ),
      home: MainScreen(),
      routes: {
        Routes.loginRoute: (context) => LoginScreen(),
        Routes.signupRoute: (context) => SignupScreen(),
        Routes.paymentMethodRoute: (context) => PaymentMethodScreen(),
        Routes.paymentDetailsRoute: (context) => PaymentDetailsScreen(),
        Routes.paymentConfirmationRoute: (context) =>
            PaymentConfirmationScreen(),
        Routes.scannerScreen: (context) => ScanCodeScreen(),
      },
    );
  }
}
