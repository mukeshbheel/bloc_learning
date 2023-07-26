
import 'package:bloc_learning/AppEvents.dart';
import 'package:bloc_learning/AppState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents, AppState>{
  AppBlocs() : super(InitialState()){
   on<IncrementEvent>((event, emit) {
     debugPrint('haalo');
     emit(AppState(counter: state.counter+1));
   });
   on<DecrementEvent>((event, emit) {
     emit(AppState(counter: state.counter-1));
   });
  }
}