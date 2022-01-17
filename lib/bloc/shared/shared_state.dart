part of "shared_bloc.dart";

abstract class SharedState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnInitialPage extends SharedState {}

class OnMerchantSignInPage extends SharedState {}

class OnMerchantRegisterPage extends SharedState {}

class OnUserSignInPage extends SharedState {}