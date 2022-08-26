

import 'package:bloc/bloc.dart';

import 'login_bloc_event.dart';
import 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {

  LoginBlocBloc(LoginBlocState initialState) : super(initialState) {
    on<LoginToServer>(_onLoginToServer);
  }

  _onLoginToServer(LoginToServer event, Emitter<LoginBlocState> emit) async {
    //handle login here
    emit(state.copyWith());
  }
}
