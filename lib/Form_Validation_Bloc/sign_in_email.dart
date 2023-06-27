import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInEmail extends StatelessWidget {
  const SignInEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        foregroundColor: Colors.white,
        title: Text('Sign in with Email'),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue.shade300,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Error will show up here",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(hintText: "Email Address"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(hintText: "Password"),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoButton(
                  onPressed: () {},
                  color: Colors.grey,
                  child: Text("Sign in"),
                ))
          ],
        ),
      ),
    );
  }
}
