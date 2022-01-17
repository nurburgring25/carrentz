import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'user_sign_in_state.dart';
part 'user_sign_in_event.dart';

class UserSignInBloc extends Bloc<UserSignInEvent, UserSignInState> {
  BuildContext buildContext;

  UserSignInBloc(this.buildContext) : super(UserSignInState.empty()) {
    on<SignInButtonClicked>((event, emitter) {

    });

    on<RegisterButtonClicked>((event, emitter) {

    });
  }
}