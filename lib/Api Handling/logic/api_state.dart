import 'package:bloc_example/Api%20Handling/data/data_model.dart';

abstract class ApiState {}

class ApiNavigationState extends ApiState {

}

class ApiInitialState extends ApiState {}

class ApiLoadedState extends ApiState {
  final List<DataModel> listDataModel;

  ApiLoadedState({required this.listDataModel});
}

class ApiLoadingState extends ApiState {}

class ApiErrorState extends ApiState {
  final String erroeMsg;

  ApiErrorState({required this.erroeMsg});
}
