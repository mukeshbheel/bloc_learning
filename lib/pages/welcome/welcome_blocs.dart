import 'package:bloc_learning/pages/welcome/welcome_events.dart';
import 'package:bloc_learning/pages/welcome/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBlocs extends Bloc<WelcomeEvents, WelcomeStates> {
  WelcomeBlocs() : super(WelcomeStates()){
    on<WelcomeEvents>((event, emit){
      emit(WelcomeStates(page: state.page));
    });
  }
}