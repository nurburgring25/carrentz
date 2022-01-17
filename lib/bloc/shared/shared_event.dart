part of 'shared_bloc.dart';

abstract class SharedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckSession extends SharedEvent {}

class GoToSignInPage extends SharedEvent {}

class GoToRegisterPage extends SharedEvent {}