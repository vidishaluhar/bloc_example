import 'package:bloc_example/Api%20Handling/data/data_model.dart';
import 'package:bloc_example/Api%20Handling/logic/api_event.dart';
import 'package:bloc_example/Api%20Handling/logic/api_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiBloc extends Bloc<ApiEvent,ApiState>
{
  final RegExp emailRegex = RegExp(
      r'^[\w\.-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)*\.[a-zA-Z]{2,6}$');

  ApiBloc() : super(ApiInitialState())
  {
    on<ApiRequestEvent>((event, emit) {
      if(!emailRegex.hasMatch(event.requestEmail))
        {
          emit(ApiErrorState("Your Email Address is Invalid"));
        }
      else if(event.requestPassword.length < 5)
        {
          emit(ApiErrorState("Your Password is Invalid"));
        }
      else
        {
          emit(ApiLoadedState());
        }
    },);

  }
}