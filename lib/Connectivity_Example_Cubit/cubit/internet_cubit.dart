import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetStateCubit { initial, gained, lost }

class InternetCubit extends Cubit<InternetStateCubit> {

  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetStateCubit.initial) {
    connectivitySubscription=connectivity.onConnectivityChanged.listen((result) {

      if(result==ConnectivityResult.wifi || result==ConnectivityResult.mobile)
        {
          emit(InternetStateCubit.gained);
        }
      else
        {
          emit(InternetStateCubit.lost);
        }

    },);
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }

}
