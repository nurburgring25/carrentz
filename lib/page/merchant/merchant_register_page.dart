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

import 'package:carrentz/common/city.dart';
import 'package:carrentz/dialog/dialogs.dart';
import 'package:flutter/material.dart';

import '../../color.dart';

class MerchantRegisterPage extends StatefulWidget {
  @override
  _MerchantRegisterPageState createState() => _MerchantRegisterPageState();
}

class _MerchantRegisterPageState extends State<MerchantRegisterPage> {
  final _businessNameController = TextEditingController();
  final _businessAddressController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();

  final _unfocusedColor = Colors.grey[600];

  final _businessNameFocusNode = FocusNode();
  final _businessAddressFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _emailAddressFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _retypePasswordFocusNode = FocusNode();

  int _index = 0;

  @override
  void initState() {
    super.initState();
    _businessNameFocusNode.addListener(() {
      setState(() {
        //Redraw so that the username label reflects the focus state
      });
    });
    _businessAddressFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
    _nameFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
    _phoneNumberFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
    _emailAddressFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
    _retypePasswordFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Sebagai Merchant"),
      ),
      body: SafeArea(
          child: Stepper(
            currentStep: _index,

            onStepCancel: () {
              if (_index > 0) {
                setState(() {
                  _index -= 1;
                });
              }
            },
            onStepContinue: () {
              if (_index < 2) {
                setState(() {
                  _index += 1;
                });
              }
            },
            onStepTapped: (int index) {
              setState(() {
                _index = index;
              });
            },
            steps: [
              Step(
                  title: Text('Informasi Usaha'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _businessNameController,
                        decoration: InputDecoration(
                            labelText: 'Nama Usaha',
                            labelStyle: TextStyle(
                                color: _businessNameFocusNode.hasFocus
                                    ? Theme.of(context).colorScheme.secondary
                                    : _unfocusedColor),
                            helperText: "Isi nama usaha anda"
                        ),
                        focusNode: _businessNameFocusNode,
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _businessAddressController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        decoration: InputDecoration(
                            labelText: 'Alamat Usaha',
                            labelStyle: TextStyle(
                                color: _businessAddressFocusNode.hasFocus
                                    ? Theme.of(context).colorScheme.secondary
                                    : _unfocusedColor),
                            helperText: "Isi alamat usaha anda"
                        ),
                        focusNode: _businessAddressFocusNode,
                      ),
                      SizedBox(height: 16.0),
                      SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            child: Text(
                              "Kota",
                              style: TextStyle(
                                  color: Colors.black38
                              ),
                            ),
                            style: ButtonStyle(
                              alignment: Alignment.centerLeft,
                              padding: MaterialStateProperty.all(EdgeInsets.all(16)),
                              side: MaterialStateProperty.all(
                                  BorderSide(
                                      color: Colors.black38,
                                      width: 0.5
                                  )
                              ),
                              shape: MaterialStateProperty.all(
                                BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Dialogs.spinner(
                                  context,
                                  'Pilih kota',
                                      (value) {

                                  },
                                  City.CITIES
                              );
                            },
                          )
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        padding: EdgeInsets.only(
                            left: 8
                        ),
                        child: Text(
                          "Silahkan pilih lokasi kota",
                          style: TextStyle(
                              color: Colors.black54
                          ),
                        ),
                      )
                    ],
                  )
              ),
              Step(
                  title: Text('Informasi Pemilik'),
                  content: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            labelText: 'Nama Pemilik',
                            labelStyle: TextStyle(
                                color: _nameFocusNode.hasFocus
                                    ? Theme.of(context).colorScheme.secondary
                                    : _unfocusedColor),
                            helperText: "Isi nama pemilik usaha"
                        ),
                        focusNode: _nameFocusNode,
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                            labelText: 'Nomor Ponsel',
                            labelStyle: TextStyle(
                                color: _phoneNumberFocusNode.hasFocus
                                    ? Theme.of(context).colorScheme.secondary
                                    : _unfocusedColor),
                            helperText: "Isi nomor ponsel pemilik"
                        ),
                        focusNode: _phoneNumberFocusNode,
                      ),
                    ],
                  )
              ),
              Step(
                  title: Text('Informasi Akun'),
                  content: Column(
                    children: [
                      TextField(
                        controller: _emailAddressController,
                        decoration: InputDecoration(
                            labelText: 'Alamat Email',
                            labelStyle: TextStyle(
                                color: _emailAddressFocusNode.hasFocus
                                    ? Theme.of(context).colorScheme.secondary
                                    : _unfocusedColor),
                            helperText: "Isi alamat email anda"
                        ),
                        focusNode: _emailAddressFocusNode,
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            labelText: 'Kata Sandi',
                            labelStyle: TextStyle(
                                color: _passwordFocusNode.hasFocus
                                    ? Theme.of(context).colorScheme.secondary
                                    : _unfocusedColor),
                            helperText: "Isi kata sandi anda"
                        ),
                        focusNode: _passwordFocusNode,
                        obscureText: true,
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _retypePasswordController,
                        decoration: InputDecoration(
                            labelText: 'Ketik Ulang Kata Sandi',
                            labelStyle: TextStyle(
                                color: _retypePasswordFocusNode.hasFocus
                                    ? Theme.of(context).colorScheme.secondary
                                    : _unfocusedColor),
                            helperText: "Silahkan ketik ulang kata sandi anda"
                        ),
                        focusNode: _retypePasswordFocusNode,
                        obscureText: true,
                      ),
                    ],
                  )
              )
            ],
          )
      ),
    );
  }
}