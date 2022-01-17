part of 'user_sign_in_bloc.dart';

abstract class UserSignInEvent extends Equatable {
    @override
    List<Object?> get props => [];
}

class SignInButtonClicked extends UserSignInEvent {

}

class RegisterButtonClicked extends UserSignInEvent {

}