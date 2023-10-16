import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_login_event.dart';
part 'signup_login_state.dart';

class SignupLoginBloc extends Bloc<SignupLoginEvent, SignupLoginState> {
  SignupLoginBloc() : super(LoginInitial()) {
    on<SignupLoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
