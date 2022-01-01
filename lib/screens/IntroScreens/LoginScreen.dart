// ignore_for_file: file_names, unnecessary_this, unnecessary_string_interpolations, use_rethrow_when_possible, non_constant_identifier_names, unnecessary_brace_in_string_interps, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'dart:convert';

//import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Screens/MainScreens/NavigationHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';

import 'ForgetPasswordScreen.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool _emailValidator = false;
  bool _passwordValidator = false;


  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: media.height * 0.05,
                          ),
                          Center(
                            child: Container(
                                width: media.width*0.55,
                                height: media.height*0.25,
                                child: Image.asset(
                                    'images/coachStationBlackIcon.png')),
                          ),
                          SizedBox(
                            height: media.height * 0.05,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('phone_num')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          defaultFormField(
                            onTap: (){
                              setState(() {
                                _emailValidator =false;
                              });
                            },
                            controller: phoneController,
                            type: TextInputType.text,
                            validate: (String val) {
                              if(val == null || val.isEmpty){
                                setState(() {
                                  _emailValidator =true;
                                });
                              }
                              else{
                                setState(() {
                                  _emailValidator =false;
                                });
                              }
                              return null;

                              // if (value.isEmpty) {
                              //   return '${AppLocalizations.of(context).trans('invalid_phone_num')}';
                              // }

                            },
                          ),
                          _emailValidator ? Align(
                            alignment: AppLocalizations.of(context).locale.languageCode == "en" ? Alignment.centerRight : Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text('${AppLocalizations.of(context).trans('invalid_phone_num')}',style: TextStyle(color: Colors.red,fontSize: 11),),
                            ),
                          )
                              :
                          const SizedBox(),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('password')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          defaultFormField(
                            validate: (val){
                              if(val == null || val.isEmpty){
                                setState(() {
                                  _passwordValidator =true;
                                });
                              }
                              else{
                                setState(() {
                                  _passwordValidator =false;
                                });
                              }
                              return null;
                            },
                            onTap: (){
                              setState(() {
                                _passwordValidator =false;
                              });
                            },
                            controller: passwordController,
                            type: TextInputType.text,
                          ),
                          _passwordValidator ? Align(
                            alignment: AppLocalizations.of(context).locale.languageCode == "en" ? Alignment.centerRight : Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text('${AppLocalizations.of(context).trans('invalid_pass')}',style: TextStyle(color: Colors.red,fontSize: 11),),
                            ),
                          )
                              :
                          const SizedBox(),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                focusColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: defaultSubtitleTextTwo(
                                    context: context,
                                    text: '${AppLocalizations.of(context).trans('forgot_pass')}',
                                    textColor: Color(0xFFcc775a)),
                                onTap: () {
                                   navigateTo(context,ForgetPasswordScreen());

                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          defaultButton(
                            text:
                                '${AppLocalizations.of(context).trans('login')}',
                            function: () {
                              navigateTo(context, NavigationHome());
                              // if (formKey.currentState.validate()) {
                              //   print(phoneController.text);
                              //   print(passwordController.text);
                              // }
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              defaultSubtitleTextOne(
                                  context: context,
                                  text: '${AppLocalizations.of(context).trans('have_no_acc_register')}'),
                              defaultTextButton(
                                  function: () {
                                    navigateTo(context, StepOneInRegisterScreen());
                                  },
                                  context: context,
                                  textKey: 'register'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
