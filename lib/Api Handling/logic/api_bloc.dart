import 'dart:async';

import 'package:bloc_example/Api%20Handling/data/fetch_data.dart';
import 'package:bloc_example/Api%20Handling/logic/api_event.dart';
import 'package:bloc_example/Api%20Handling/logic/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitialState()) {
    on<ApiSignInButtonNavigateEvent>(apiSignInButtonNavigate);
  }

  FutureOr<void> apiSignInButtonNavigate(
      ApiSignInButtonNavigateEvent event, Emitter<ApiState> emit) async {
    emit(ApiLoadingState());
    try
        {
          final data = await FetchData.fetchDataFromApi().then((data) => data,);
          debugPrint("$data");
          emit(ApiLoadedState(listDataModel:data));
        }
        catch(e)
    {
      emit(ApiErrorState(erroeMsg: 'Failed To fetch Data : $e'));
    }
  }
}
