import 'package:bloc_example/Form_Validation_Bloc/bloc/sign_in_bloc.dart';
import 'package:bloc_example/Form_Validation_Bloc/pages/sign_in_email.dart';
import 'package:bloc_example/Form_Validation_Bloc/pages/sign_in_phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormValidationExample extends StatelessWidget {
  const FormValidationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Form Validation',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade500),
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue.shade300)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) {
                            return SignInBloc();
                          },
                          child: SignInEmail(),
                        ),
                      ),
                    );
                  },
                  child: const Text('Sign in with Email',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue.shade300)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPhoneNumber(),
                        ));
                  },
                  child: const Text('Sign in with Phone Number',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
