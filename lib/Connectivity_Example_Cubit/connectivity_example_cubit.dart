import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/internet_cubit.dart';

class ConnectivityExampleCubit extends StatelessWidget {
  const ConnectivityExampleCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Connectivity Example'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue.shade300,
          automaticallyImplyLeading: true,
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarColor: Colors.blue.shade300,
              systemNavigationBarColor: Colors.blue.shade300),
        ),
        body: Center(child: BlocBuilder<InternetCubit, InternetStateCubit>(
          builder: (context, state) {
            debugPrint("$state");
            switch (state) {
              case InternetStateCubit.gained:
                return const Text("Connected 😉",style: TextStyle(fontSize: 20),);
              case InternetStateCubit.lost:
                return const Text("Not Connected 🧐",style: TextStyle(fontSize: 20),);
              case InternetStateCubit.initial:
                return const Text("Loading ... 🥲",style: TextStyle(fontSize: 20),);
            }
          },
        )));
  }
}
