import 'package:bloc_example/Connectivity_Example_Bloc/bloc/internet_bloc.dart';
import 'package:bloc_example/Connectivity_Example_Bloc/connectivity_example_bloc.dart';
import 'package:bloc_example/Connectivity_Example_Cubit/connectivity_example_cubit.dart';
import 'package:bloc_example/Connectivity_Example_Cubit/cubit/internet_cubit.dart';
import 'package:bloc_example/Form_Validation_Bloc/form_validation_example.dart';
import 'package:bloc_example/Api%20Handling/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/ConnectivityExampleBloc':
        return MaterialPageRoute(builder: (BuildContext context) {
          return BlocProvider(
              create: (BuildContext context) {
                return InternetBloc();
              },
              child: ConnectivityExampleBloc());
        });
      case '/ConnectivityExampleCubit':
        return MaterialPageRoute(builder: (BuildContext context) {
          return BlocProvider(
              create: (BuildContext context) {
                return InternetCubit();
              },
              child: ConnectivityExampleCubit());
        });
      case '/FormValidationExample':
        return MaterialPageRoute(builder: (BuildContext context) {
          return FormValidationExample();
        });
      case '/Home':
        return MaterialPageRoute(builder: (BuildContext context) {
          return Home();
        });
    }
  }
}
