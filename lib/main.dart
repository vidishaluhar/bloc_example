import 'package:bloc_example/Connectivity%20Example/bloc/internet_bloc.dart';
import 'package:bloc_example/Connectivity%20Example/connectivity_example.dart';
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
    return BlocProvider(
      create: (_) {
        return InternetBloc();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
        routes: {
          '/ConnectivityExample': (context) => ConnectivityExample(),
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
          children: [CustomElevatedButton(pathName: '/ConnectivityExample',text: 'Connectivity Example',)],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {

  final String pathName;
  final String text;

  const CustomElevatedButton({
    super.key, required this.pathName, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context,pathName);
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade300,
            foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 20)
      ),
    );
  }
}
