import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_grocery/screens/scan_code_screen.dart';
import 'package:smart_grocery/services/authentication_helper.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
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
              'Create Account',
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
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z]+[ a-zA-Z]*')),
                            FilteringTextInputFormatter.deny('@'),
                          ],
                          decoration: InputDecoration(
                            fillColor: Colors.grey[350],
                            filled: true,
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: 'Username',
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          validator: (value) {
                            return validateField(value, 'Username');
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
                            hintText: 'Confirm Password',
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
                                  .signUp(
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
                          child: Text('Signup')),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ],
                ),
              ),
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

  static String? validateField(String? value, String? message) {
    return value!.isEmpty ? '$message cannot be empty' : null;
  }
}
