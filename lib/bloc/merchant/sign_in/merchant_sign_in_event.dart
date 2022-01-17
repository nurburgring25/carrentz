part of 'merchant_sign_in_bloc.dart';

abstract class MerchantSignInEvent extends Equatable {
    @override
    List<Object?> get props => [];
}

class SignInButtonClicked extends MerchantSignInEvent {

}

class RegisterButtonClicked extends MerchantSignInEvent {

}