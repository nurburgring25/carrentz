part of 'merchant_sign_in_bloc.dart';

@immutable
class MerchantSignInState {
  MerchantSignInState();

  factory MerchantSignInState.empty() {
    return MerchantSignInState();
  }

  factory MerchantSignInState.loading() {
    return MerchantSignInState();
  }

  factory MerchantSignInState.failure() {
    return MerchantSignInState();
  }

  factory MerchantSignInState.success() {
    return MerchantSignInState();
  }
}