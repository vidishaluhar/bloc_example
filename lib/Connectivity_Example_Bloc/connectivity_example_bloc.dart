
import 'package:bloc_example/Connectivity_Example_Bloc/bloc/internet_bloc.dart';
import 'package:bloc_example/Connectivity_Example_Bloc/bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityExampleBloc extends StatelessWidget {
  const ConnectivityExampleBloc({super.key});

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
        body: Center(
            child: BlocConsumer<InternetBloc, InternetStateBloc>(
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Connected 😉");
            } else if (state is InternetLostState) {
              return const Text("Not Connected 🧐");
            } else {
              return const Text("Loading ... 🥲");
            }
          },
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("Connected to Internet")));
            }

            else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Not Connected to Internet")));
            }
          },
        )
            /*BlocBuilder<InternetBloc,InternetState>(builder: (context, state) {

          if(state is InternetGainedState)
            {
              return Text("Connected 😉");
            }
          else if(state is InternetLostState)
            {
              return Text("Not Coonnected 🧐");
            }
          else
            {
              return Text("Loading ... 🥲");
            }
        },
      ),*/
            ));
  }
}
