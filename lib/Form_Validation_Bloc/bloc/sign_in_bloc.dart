import 'package:bloc_example/Form_Validation_Bloc/bloc/sign_in_event.dart';
import 'package:bloc_example/Form_Validation_Bloc/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>
{
  final RegExp emailRegex = RegExp(
      r'^[\w\.-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)*\.[a-zA-Z]{2,6}$');

  SignInBloc() : super(SignInInitialState())
  {
    on<SignInTextChangedEvent>((event, emit) {
      if(!emailRegex.hasMatch(event.emailValue))
        {
          emit(SignInErrorState("Please Enter a Valid Email Address"));
        }
      else if(event.passwordValue.length < 5)
        {
          emit(SignInErrorState("Please Enter a Valid Password"));
        }
      else
        {
          emit(SignInValidState());
        }
    },);
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    },);
  }
}