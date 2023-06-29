
import 'package:bloc_example/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      onGenerateRoute: Routes.onGenerateRoutes
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text("Bloc Example"),
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarColor: Colors.blue.shade300,
              systemNavigationBarColor: Colors.blue.shade300),
          backgroundColor: Colors.blue.shade300),
      body: const Center(
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
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade300,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 20)),
        child: Text(text),
      ),
    );
  }
}
