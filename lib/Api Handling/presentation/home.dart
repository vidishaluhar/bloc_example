
import 'package:bloc_example/Api%20Handling/logic/api_bloc.dart';
import 'package:bloc_example/Api%20Handling/logic/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // FetchData fetchData=FetchData();
    // fetchData.fetchDataFromApi();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade300,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.blue.shade300,
            systemNavigationBarColor: Colors.blue.shade300),
      ),
      body: BlocBuilder<ApiBloc, ApiState>(


        // bloc: apiBloc,
        // buildWhen: (previous, current) => current is ApiNavigationState,
        // listenWhen: (previous, current) => current is ApiNavigationState,
        builder: (BuildContext context, state) {
          debugPrint("${state.runtimeType}");
          if (state is ApiLoadedState) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.listDataModel.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  subtitle: Text(state.listDataModel[index].title,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      )),
                  title: Text(state.listDataModel[index].body,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                );
              },
            );
          } else if (state is ApiLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ApiErrorState) {
            return Center(
                child: Text(
              state.erroeMsg,
              style: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w500, color: Colors.red),
            ));
          }
          else
            {
              return Container();
            }
        },
      ),
    );
  }
}
