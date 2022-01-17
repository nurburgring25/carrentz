import 'package:carrentz/bloc/shared/shared_bloc.dart';
import 'package:carrentz/page/merchant/merchant_register_page.dart';
import 'package:carrentz/page/merchant/merchant_sign_in_page.dart';
import 'package:carrentz/page/splash_page.dart';
import 'package:carrentz/page/user/user_sign_in_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedBloc, SharedState>(builder: (context, state) {
      if (state is OnMerchantSignInPage) {
        return MerchantSignInPage();
      } else if (state is OnMerchantRegisterPage) {
        return MerchantRegisterPage();
      } else if (state is OnUserSignInPage) {
        return UserSignInPage();
      } else {
        return SplashPage();
      }
    });
  }
}