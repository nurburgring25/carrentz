import 'package:carrentz/bloc/merchant/sign_in/merchant_sign_in_bloc.dart';
import 'package:carrentz/bloc/shared/shared_bloc.dart';
import 'package:carrentz/bloc/user/sign_in/user_sign_in_bloc.dart';
import 'package:carrentz/widget/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'color.dart';
import 'supplemental/cut_corners_border.dart';

final String mode = 'MERCHANT';

class CarrentzApp extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            var sharedBloc = SharedBloc(context);

            GetIt.I.registerSingleton<SharedBloc>(sharedBloc);

            return sharedBloc..add(CheckSession());
          }),
          BlocProvider(create: (context) => MerchantSignInBloc(buildContext)),
          BlocProvider(create: (context) => UserSignInBloc(buildContext))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _carrentzTheme,
          home: Wrapper(),
        )
    );
  }
}

final ThemeData _carrentzTheme = _buildCarrentzTheme();

ThemeData _buildCarrentzTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: mode == 'MERCHANT' ? carrentzBlue100 : carrentzTeal100,
      onPrimary: mode == 'MERCHANT' ? carrentzBlue900 : carrentzTeal900,
      secondary: mode == 'MERCHANT' ? carrentzBlue900 : carrentzTeal900,
      error: carrentzErrorRed,
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: mode == 'MERCHANT' ? carrentzBlue100 : carrentzTeal100,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backwardsCompatibility: false,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: mode == 'MERCHANT' ? carrentzBlue900 : carrentzTeal900,
        ),
      ),
      border: CutCornersBorder(), // Replace code
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline5: base.headline5!.copyWith(
      fontWeight: FontWeight.w500,
    ),
    headline6: base.headline6!.copyWith(
      fontSize: 18.0,
    ),
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: mode == 'MERCHANT' ? carrentzBlue900 : carrentzTeal900,
    bodyColor: mode == 'MERCHANT' ? carrentzBlue900 : carrentzTeal900,
  );
}