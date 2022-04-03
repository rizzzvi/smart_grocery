import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_grocery/constants/data_provider.dart';
import 'package:smart_grocery/screens/cart_screen.dart';
import 'package:smart_grocery/screens/login_screen.dart';
import 'package:smart_grocery/screens/main_screen.dart';
import 'package:smart_grocery/screens/payment_confirmation_screen.dart';
import 'package:smart_grocery/screens/payment_details_screen.dart';
import 'package:smart_grocery/screens/payment_method_screen.dart';
import 'package:smart_grocery/screens/routes.dart';
import 'package:smart_grocery/screens/scan_code_screen.dart';
import 'package:smart_grocery/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD6gUueyBzcyO65qgvo-OSky0Iu9uhxKUM", // Your apiKey
      appId: "1:391065546462:android:501e6317961968e9369c4f", // Your appId
      messagingSenderId: "XXX", // Your messagingSenderId
      projectId: "smart-grocery-9c2bd", // Your projectId
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Grocery',
        theme: ThemeData(
          primaryColor: Color(0xFF070DF5),
          textTheme: TextTheme(
            headline1: TextStyle(
                color: Color(0xFF070DF5), fontSize: 70, letterSpacing: 12),
            headline3: TextStyle(color: Color(0xFF070DF5), fontSize: 20),
            headline2: TextStyle(color: Colors.black, fontSize: 36),
          ),
        ),
        home: LoginScreen(),
        routes: {
          Routes.loginRoute: (context) => LoginScreen(),
          Routes.signupRoute: (context) => SignupScreen(),
          Routes.paymentMethodRoute: (context) => PaymentMethodScreen(),
          Routes.paymentDetailsRoute: (context) => PaymentDetailsScreen(),
          Routes.paymentConfirmationRoute: (context) =>
              PaymentConfirmationScreen(),
          Routes.scannerScreen: (context) => ScanCodeScreen(),
          Routes.cartScreen: (context) => CartScreen(),
        },
      ),
    );
  }
}
