import 'package:bloc/bloc.dart';
import 'package:carrentz/common/constant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_state.dart';
part 'shared_event.dart';

class SharedBloc extends Bloc<SharedEvent, SharedState> {
  BuildContext buildContext;

  SharedBloc(this.buildContext) : super(OnInitialPage()) {
    on<CheckSession>((event, emitter) async {
      final sharedPreferences = await SharedPreferences.getInstance();

      if (sharedPreferences.containsKey(SharedPreferenceKey.SESSION_ID.name())) {

      } else {
        this.add(GoToSignInPage());
      }
    });

    on<GoToSignInPage>((event, emitter) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      final mode = sharedPreferences.getString(SharedPreferenceKey.APPLICATION_MODE.name()) ?? ApplicationMode.USER.name();

      if (mode == ApplicationMode.MERCHANT.name()) {
        emitter.call(OnMerchantSignInPage());
      } else {
        emitter.call(OnUserSignInPage());
      }
    });

    on<GoToRegisterPage>((event, emitter) async {

    });
  }
}