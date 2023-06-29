import 'package:bloc_example/Form_Validation_Bloc/pages/verify_number.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInPhoneNumber extends StatelessWidget {
  SignInPhoneNumber({super.key});

  TextEditingController phoneNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign in with Phone Number"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue.shade300,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.blue.shade300,
              systemNavigationBarColor: Colors.blue),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(maxLength: 10,
                  controller: phoneNumController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.phone),
                      hintText: "Enter Phone Number"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyNumber(),
                        ));
                  },
                  color: Colors.blue.shade300,
                  child: const Text("Sign in"),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
