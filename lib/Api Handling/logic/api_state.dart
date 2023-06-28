import 'package:bloc_example/Api%20Handling/data/data_model.dart';
import 'package:bloc_example/Api%20Handling/data/fetch_data.dart';

abstract class ApiState{}

class ApiInitialState extends ApiState{}

class ApiLoadingState extends ApiState{}

class ApiLoadedState extends ApiState{
  final FetchData fetchData;

  ApiLoadedState(this.fetchData);
}

class ApiErrorState extends ApiState{
  final String error;

  ApiErrorState(this.error);

}