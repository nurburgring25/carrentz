// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:carrentz/bloc/shared/shared_bloc.dart';
import 'package:carrentz/bloc/user/sign_in/user_sign_in_bloc.dart';
import 'package:carrentz/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../color.dart';

class UserSignInPage extends StatefulWidget {
  @override
  _UserSignInPageState createState() => _UserSignInPageState();
}

class _UserSignInPageState extends State<UserSignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {
        //Redraw so that the username label reflects the focus state
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserSignInBloc, UserSignInState>(
      listener: (context, state) {

      },
      child: Scaffold(
        backgroundColor: carrentzTeal900,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text("Ke Aplikasi Merchant"),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(16)),
                  shape: MaterialStateProperty.all(
                    BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
                onPressed: () async {
                  final sharedPreferences = await SharedPreferences.getInstance();

                  sharedPreferences.setString(SharedPreferenceKey.APPLICATION_MODE.name(), ApplicationMode.MERCHANT.name());

                  context.read<SharedBloc>().add(GoToSignInPage());
                },
              ),
              SizedBox(height: 80.0),
              Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/app_icon_white.png',
                        width: 150,
                        height: 70,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Selamat Datang di CarrentZ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            fontFamily: 'Rubik'
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Rental mobil jaman now yang ga pake ribet #RentalRibetless',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontFamily: 'Rubik'
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                child: Text("MASUK"),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(16)),
                  shape: MaterialStateProperty.all(
                    BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
                onPressed: () {
                  context.read<UserSignInBloc>().add(SignInButtonClicked());
                },
              ),
              SizedBox(height: 16.0),
              OutlinedButton(
                child: Text("DAFTAR"),
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      BorderSide(
                          color: carrentzTeal100,
                          width: 0.5
                      )
                  ),
                  padding: MaterialStateProperty.all(EdgeInsets.all(16)),
                  shape: MaterialStateProperty.all(
                    BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
                onPressed: () {
                  context.read<UserSignInBloc>().add(RegisterButtonClicked());
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'atau lanjut dengan',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: carrentzTeal100,
                    fontSize: 13.0,
                    fontFamily: 'Rubik'
                ),
              ),
              SizedBox(height: 16.0),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Icon(Icons.facebook),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                      shape: MaterialStateProperty.all(
                        BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        ),
                      ),
                    ),
                    onPressed: () {

                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      "G",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          fontFamily: 'Rubik'
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                      shape: MaterialStateProperty.all(
                        BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        ),
                      ),
                    ),
                    onPressed: () {

                    },
                  ),
                ],
              ),
              SizedBox(height: 80.0),
              Text(
                'Dibuat oleh BurikkStudio®',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: carrentzTeal100,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                    fontFamily: 'Rubik'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}