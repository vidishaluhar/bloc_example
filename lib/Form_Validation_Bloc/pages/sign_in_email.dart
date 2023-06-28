import 'package:bloc_example/Form_Validation_Bloc/bloc/sign_in_bloc.dart';
import 'package:bloc_example/Form_Validation_Bloc/bloc/sign_in_event.dart';
import 'package:bloc_example/Form_Validation_Bloc/bloc/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInEmail extends StatelessWidget {
  SignInEmail({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        foregroundColor: Colors.white,
        title: const Text('Sign in with Email'),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue.shade300,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (BuildContext context, state) {
                  if (state is SignInErrorState) {
                    return Text(state.errorMsg,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: emailController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailController.text, passwordController.text));
                },
                decoration: const InputDecoration(hintText: "Email Address"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailController.text, passwordController.text));
                },
                decoration: const InputDecoration(hintText: "Password"),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (BuildContext context, state) {
                    if (state is SignInLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CupertinoButton(
                      onPressed: () {
                        if (state is SignInValidState) {
                          BlocProvider.of<SignInBloc>(context).add(
                              SignInSubmittedEvent(emailController.text,
                                  passwordController.text));
                          Navigator.pushNamed(context,'/Home');
                        }
                      },
                      color: (state is SignInValidState)
                          ? Colors.blue
                          : Colors.grey,
                      child: const Text("Sign in"),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
