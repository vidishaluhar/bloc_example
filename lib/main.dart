import 'package:bloc_example/Connectivity_Example_Bloc/bloc/internet_bloc.dart';
import 'package:bloc_example/Connectivity_Example_Bloc/connectivity_example_bloc.dart';
import 'package:bloc_example/Connectivity_Example_Cubit/connectivity_example_cubit.dart';
import 'package:bloc_example/Connectivity_Example_Cubit/cubit/internet_cubit.dart';
import 'package:bloc_example/Form_Validation_Bloc/form_validation_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) { return InternetBloc(); },),

        BlocProvider(create: (_) { return InternetCubit(); },)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
        routes: {
          '/ConnectivityExampleBloc': (context) => ConnectivityExampleBloc(),
          '/ConnectivityExampleCubit': (context) => ConnectivityExampleCubit(),
          '/FormValidationExample': (context) => FormValidationExample(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text("Bloc Example"),
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarColor: Colors.blue.shade300,
              systemNavigationBarColor: Colors.blue.shade300),
          backgroundColor: Colors.blue.shade300),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              pathName: '/ConnectivityExampleBloc',
              text: 'Connectivity Example using Bloc',
            ),
            CustomElevatedButton(
              pathName: '/ConnectivityExampleCubit',
              text: 'Connectivity Example using Cubit',
            ),
            CustomElevatedButton(
              pathName: '/FormValidationExample',
              text: 'Form Validation Example',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String pathName;
  final String text;

  const CustomElevatedButton({
    super.key,
    required this.pathName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, pathName);
        },
        child: Text(text),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade300,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 20)),
      ),
    );
  }
}
