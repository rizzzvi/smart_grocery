import 'package:flutter/material.dart';
import 'package:smart_grocery/screens/routes.dart';
import 'package:smart_grocery/screens/scan_code_screen.dart';
import 'package:smart_grocery/services/authentication_helper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailTxt = TextEditingController();
  var passwordTxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              'LOGIN',
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: Colors.black),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Form(
              key: formKey,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          controller: emailTxt,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[350],
                            filled: true,
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: 'Email',
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          validator: (value) {
                            return validateEmail(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          controller: passwordTxt,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            fillColor: Colors.grey[350],
                            filled: true,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: 'Password',
                          ),
                          validator: (value) {
                            return validatePassword(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            AuthenticationHelper()
                                .signIn(
                                    email: emailTxt.text,
                                    password: passwordTxt.text)
                                .then(
                              (result) {
                                if (result == null) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ScanCodeScreen()));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        result,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          }
                          ;
                        },
                        child: Text('Login'),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.signupRoute,
                );
              },
              child: Text('Signup Instead!'),
            ),
          ],
        ),
      ),
    );
  }

  static String? validateEmail(String? value) {
    return value!.isEmpty
        ? 'Email cannot be Empty'
        : !value.contains('@')
            ? 'Please provide a valid email'
            : null;
  }

  static String? validatePassword(String? value) {
    return value!.isEmpty
        ? "Password cannot be Empty"
        : value.length < 8
            ? 'Password should be at least 8 character long'
            : null;
  }
}
