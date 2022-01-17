part of 'user_sign_in_bloc.dart';

@immutable
class UserSignInState {
  UserSignInState();

  factory UserSignInState.empty() {
    return UserSignInState();
  }

  factory UserSignInState.loading() {
    return UserSignInState();
  }

  factory UserSignInState.failure() {
    return UserSignInState();
  }

  factory UserSignInState.success() {
    return UserSignInState();
  }
}