import 'package:bloc_example/Api%20Handling/presentation/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyNumber extends StatelessWidget {
  VerifyNumber({super.key});

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Your Phone Number"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade300,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.blue.shade300,
            systemNavigationBarColor: Colors.blue.shade300),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                maxLength: 6,
                controller: otpController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "6-Digit OTP"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: CupertinoButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                },
                child: Text("Verify"),
                color: Colors.blue.shade300,
              ),
            )
          ],
        ),
      )),
    );
  }
}
