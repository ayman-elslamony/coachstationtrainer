// ignore_for_file: file_names, unnecessary_this, unnecessary_string_interpolations, use_rethrow_when_possible, non_constant_identifier_names, unnecessary_brace_in_string_interps, must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:ui';
import 'package:coachstationtrainer/Helper/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coachstationtrainer/Helper/Helper.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';

//import 'package:coachstationtrainer/provider/UserProvider.dart';
import 'package:coachstationtrainer/provider/locale_provider.dart';

//import 'package:coachstationtrainer/screens/SubScreens/ResetPassword.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';

class Verification extends StatefulWidget {
  static const String routName = '/Verification_Screen';

//  var title, verificationCode, token;
//  Verification({Key key, this.title,this.verificationCode,this.token}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  List<bool> _isSelected;
  final TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isSubmitting = false;
  var _locale;
  String code;
  var guest;
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    super.initState();

    _locale = Provider.of<LocaleProvider>(context, listen: false).locale;
//    Provider.of<UserDataProvider>(context,listen: false).getUserData();
    errorController = StreamController<ErrorAnimationType>();
    print(Helper.token);
  }

  bool _isInit = false;

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    errorController.close();

    focusNode.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

//  void _submit() async {
//    final form = _formKey.currentState;
//    if (form.validate()) {
//      form.save();
//
//      setState(() {
//        _isSubmitting = true;
//      });
//      print("hello code");
//      print(code);
//      print(widget.verificationCode);
//      if (code.isEmpty || code ==null || code.toString() != widget.verificationCode.toString() ) {
//        setState(() {
//          _isSubmitting = false;
//        });
//        showSnack(
//            context: context,
//            msg: '${AppLocalizations.of(context).trans('invalidCode')}',
//            fullHeight: 30.0,
//            isFloating: true,
//            scaffoldKey: _scaffoldKey
//        );
//      }
//      else{
//        if (widget.title == 'forgetPassword') {
//          Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
//        }
//        else{
//          Provider.of<UserDataProvider>(context, listen: false)
//              .verifyUser(
//              context: context,
//              locale: _locale,
//              email: Helper.userEmail,
//            token: widget.token
//          )
//              .then((val) => {
//            setState(() {
//              _isSubmitting = false;
//            })
//          });
//        }
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Container(
        width: media.width,
        height: media.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFFc38c0a),
          Color(0xFFd0d441),
          Color(0xFFe2a109),
        ])),
        child: Scaffold(
          key: _scaffoldKey,
          appBar: defaultAppBar(
            context: context,
            titleKey: 'new_password',
          ),
          body: Container(
            height: media.height,
            width: media.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                color: Color(0xFFFCFCFC)),
            child: Padding(
              padding: EdgeInsets.only(top: media.height * 0.09),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Text(
                      AppLocalizations.of(context)
                          .trans("the_activation_code_now_be_sent"),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      '0111568764',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                        color: defaultColor
                      ),
                    ),
                    SizedBox(height: 80,),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 5.0,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 20.0, top: 20),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .trans("enter_the_activation_code"),
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 30),
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: PinCodeTextField(
                                      backgroundColor: Colors.white,
                                      appContext: context,

                                      // pastedTextStyle: TextStyle(
                                      //   color: Colors.green.shade600,
                                      //   fontWeight: FontWeight.bold,
                                      // ),
                                      length: 4,
                                      // obscureText: true,
                                      // obscuringCharacter: '*',
                                      // obscuringWidget: FlutterLogo(
                                      //   size: 24,
                                      // ),
                                      // blinkWhenObscuring: true,
                                      animationType: AnimationType.fade,
                                      // validator: (v) {
                                      //   if (v.length < 4) {
                                      //     return "I'm from validator";
                                      //   } else {
                                      //     return null;
                                      //   }
                                      // },
                                      pinTheme: PinTheme(
                                        shape: PinCodeFieldShape.box,
                                        activeColor: Colors.grey[300],
                                        disabledColor: Colors.grey[300],
                                        inactiveColor: Colors.grey[300],
                                        inactiveFillColor: Colors.grey[300],
                                        selectedColor: Colors.grey[300],
                                        selectedFillColor: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(5),
                                        // fieldHeight: 50,
                                        // fieldWidth: 40,
                                        activeFillColor: Colors.grey[300],
                                      ),
                                      cursorColor: Theme.of(context).primaryColor,
                                      animationDuration:
                                          Duration(milliseconds: 300),
                                      enableActiveFill: true,
                                      errorAnimationController: errorController,
                                      controller: textEditingController,
                                      autoFocus: true,
                                      keyboardType: TextInputType.number,
                                      // boxShadows: [
                                      //   BoxShadow(
                                      //     offset: Offset(0, 1),
                                      //     color: Colors.black12,
                                      //     blurRadius: 10,
                                      //   )
                                      // ],
                                      onCompleted: (v) {
                                        setState(() {
                                          currentText = v;
                                          code = v;
                                        });
                                      },
                                      // onTap: () {
                                      //   print("Pressed");
                                      // },
                                      onChanged: (value) {
                                        print(value);
                                        setState(() {
                                          currentText = value;
                                          code = value;
                                        });
                                      },
                                      beforeTextPaste: (text) {
                                        print("Allowing to paste $text");
                                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                        return true;
                                      },
                                    ),
                                  )),
                              Center(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: media.height * 0.05),
                                    child: _isSubmitting
                                        ? SpinKitWave(
                                            color: Theme.of(context).primaryColor,
                                            size: 40.0,
                                          )
                                        : SizedBox()
//                                      submitButton(
//                                          height: 40.0,
//                                          borderRadius: 10.0,
//                                          context: context,
//                                          titleFontSize: 16.0,
//                                          buttonW: media.width*0.8,
//                                          borderColor: Theme.of(context).primaryColor,
//                                          buttonColor: Theme.of(context).primaryColor,
//                                          buttonTitle: '${AppLocalizations.of(context).trans('send')}',
//                                          titleColor: Colors.white,
//                                          onClicked: (){
//                                           // _submit();
//                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
//                                          }
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
