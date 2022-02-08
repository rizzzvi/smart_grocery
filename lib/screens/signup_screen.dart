import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[350],
                          filled: true,
                          prefixIcon: Icon(Icons.person_outline),
                          hintText: 'Username',
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextFormField(
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
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
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
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
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
                          hintText: 'Confirm Password',
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
                          ),
                          onPressed: () {},
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
}
