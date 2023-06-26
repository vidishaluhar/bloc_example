import 'package:bloc_example/Connectivity%20Example/bloc/internet_bloc.dart';
import 'package:bloc_example/Connectivity%20Example/bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityExample extends StatelessWidget {
  const ConnectivityExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connectivity Example'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade300,
        automaticallyImplyLeading: true,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarColor: Colors.blue.shade300,
            systemNavigationBarColor: Colors.blue.shade300),
      ),
      body: Center(
        child: BlocBuilder<InternetBloc,InternetState>(builder: (context, state) {

          if(state is InternetGainedState)
            {
              return Text("Connected");
            }
          else if(state is InternetLostState)
            {
              return Text("Not Coonnected");
            }
          else
            {
              return Text("Loading ...");
            }
        },
      ),
    ));
  }
}
