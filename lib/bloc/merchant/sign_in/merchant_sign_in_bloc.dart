import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'merchant_sign_in_state.dart';
part 'merchant_sign_in_event.dart';

class MerchantSignInBloc extends Bloc<MerchantSignInEvent, MerchantSignInState> {
  BuildContext buildContext;

  MerchantSignInBloc(this.buildContext) : super(MerchantSignInState.empty()) {
    on<SignInButtonClicked>((event, emitter) {

    });

    on<RegisterButtonClicked>((event, emitter) {

    });
  }
}