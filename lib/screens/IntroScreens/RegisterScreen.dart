// ignore_for_file: file_names, unnecessary_this, unnecessary_string_interpolations, use_rethrow_when_possible, non_constant_identifier_names, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/screens/IntroScreens/VerificationTrainerData.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:coachstationtrainer/provider/locale_provider.dart';

//import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:coachstation/Helper/Widgets.dart';
//import 'package:coachstation/main.dart';
//import 'dart:convert';
//import 'dart:developer';
//import 'dart:io';
//import 'package:country_code_picker/country_code_picker.dart';
//import 'package:coachstation/models/Country.dart';
//import 'package:coachstation/provider/BrandsProvider.dart';
//import 'package:coachstation/provider/UserProvider.dart';
//import 'package:coachstation/provider/changeIndexPage.dart';
//import 'package:coachstation/screens/MainScreens/NavigationHome.dart';
//import 'package:coachstation/screens/SubScreens/PaymentScreens.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:showcaseview/showcase_widget.dart';

class StepOneInRegisterScreen extends StatefulWidget {
  static const String routName = '/Register_Screen';

  @override
  _StepOneInRegisterScreenState createState() =>
      _StepOneInRegisterScreenState();
}

class _StepOneInRegisterScreenState extends State<StepOneInRegisterScreen> {
  bool _isSubmitting = false;
  bool _isChecked = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _nameValidator = false;
  bool _phoneValidator = false;
  bool _emailValidator = false;
  bool _passwordValidator = false;

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

//  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String fcmToken;

  @override
  void initState() {
    super.initState();

//    firebaseMessaging.getToken().then((token){
//      fcmToken = token;
//    });
  }

//  void _submit() async {
//    final form = _formKey.currentState;
//    if (form.validate()) {
//      form.save();    setState(() {
//      _isSubmitting = true;
//    });
//      Provider.of<UserDataProvider>(context, listen: false)
//          .register(
//          context: context,
//          locale: _locale,
//          name: _name,
//          phone: _phone,
//          email: _email,
//          fcmToken: fcmToken,
//          password: _password,
//          countryKey: _dialCode)
//          .then((val) => {
//        setState(() {
//          _isSubmitting = false;
//        })
//      });
//    // }
//    }
//  }

  Widget checkedBoxCard(
      {BuildContext context, String text, bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
          border: Border.all(color: Colors.grey[300])),
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.grey[300]),
        child: CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 2.0),
          activeColor: Theme.of(context).primaryColor,
          title: defaultSubtitleTextOne(context: context, text: text),
          value: isSelected,
          onChanged: (newValue) {
            setState(() {
              isSelected = newValue;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
        key: _scaffoldKey,
        appBar: defaultAppBar(context: context, titleKey: 'regist'),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: defaultColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          )),
                      child: Center(
                          child: Text(
                        '1',
                        style: Theme.of(context).textTheme.headline3,
                      )),
                    ),
                    title: Text(
                      '${AppLocalizations.of(context).trans('personal_data')}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    subtitle: Text(
                      '${AppLocalizations.of(context).trans('step1_of_3')}',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('name')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          defaultFormField(
                            controller: nameController,
                            type: TextInputType.text,
                            validate: (val) {
                              if (val == null || val.isEmpty) {
                                setState(() {
                                  _nameValidator = true;
                                });
                              } else {
                                setState(() {
                                  _nameValidator = false;
                                });
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                _nameValidator = false;
                              });
                            },
                          ),
                          _nameValidator
                              ? Align(
                                  alignment: AppLocalizations.of(context)
                                              .locale
                                              .languageCode ==
                                          "en"
                                      ? Alignment.centerRight
                                      : Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      '${AppLocalizations.of(context).trans('invalid_name')}',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 3.0,
                          ),
                          new Text(
                            '${AppLocalizations.of(context).trans('specialist')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          checkedBoxCard(
                              context: context,
                              text:
                                  '${AppLocalizations.of(context).trans('jim')}',
                              isSelected: true),
                          checkedBoxCard(
                              context: context,
                              text:
                                  '${AppLocalizations.of(context).trans('physical_therapy')}',
                              isSelected: false),
                          checkedBoxCard(
                              context: context,
                              text:
                                  '${AppLocalizations.of(context).trans('boxing')}',
                              isSelected: true),
                          checkedBoxCard(
                              context: context,
                              text:
                                  '${AppLocalizations.of(context).trans('yoga')}',
                              isSelected: false),
                          checkedBoxCard(
                              context: context,
                              text:
                                  '${AppLocalizations.of(context).trans('zimba')}',
                              isSelected: false),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('phone_num')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          defaultFormField(
                            controller: phoneController,
                            type: TextInputType.text,
                            validate: (val) {
                              if (val == null || val.isEmpty) {
                                setState(() {
                                  _phoneValidator = true;
                                });
                              } else {
                                setState(() {
                                  _phoneValidator = false;
                                });
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                _phoneValidator = false;
                              });
                            },
                          ),
                          _phoneValidator
                              ? Align(
                                  alignment: AppLocalizations.of(context)
                                              .locale
                                              .languageCode ==
                                          "en"
                                      ? Alignment.centerRight
                                      : Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      '${AppLocalizations.of(context).trans('invalid_phone_num')}',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('email')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          defaultFormField(
                            controller: emailController,
                            type: TextInputType.text,
                            validate: (val) {
                              if (val == null || val.isEmpty) {
                                setState(() {
                                  _emailValidator = true;
                                });
                              } else {
                                setState(() {
                                  _emailValidator = false;
                                });
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                _emailValidator = false;
                              });
                            },
                          ),
                          _emailValidator
                              ? Align(
                                  alignment: AppLocalizations.of(context)
                                              .locale
                                              .languageCode ==
                                          "en"
                                      ? Alignment.centerRight
                                      : Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      '${AppLocalizations.of(context).trans('invalid_email')}',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('password')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          defaultFormField(
                            controller: passwordController,
                            type: TextInputType.text,
                            validate: (val) {
                              if (val == null || val.isEmpty) {
                                setState(() {
                                  _passwordValidator = true;
                                });
                              } else {
                                setState(() {
                                  _passwordValidator = false;
                                });
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                _passwordValidator = false;
                              });
                            },
                          ),
                          _passwordValidator
                              ? Align(
                                  alignment: AppLocalizations.of(context)
                                              .locale
                                              .languageCode ==
                                          "en"
                                      ? Alignment.centerRight
                                      : Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      '${AppLocalizations.of(context).trans('invalid_pass')}',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Align(
                            alignment: AppLocalizations.of(context)
                                        .locale
                                        .languageCode ==
                                    "en"
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _isChecked = !_isChecked;
                                        });
                                      },
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: _isChecked
                                                ? Theme.of(context).primaryColor
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            border: Border.all(
                                                color: _isChecked
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : Colors.grey[400])),
                                        child: _isChecked
                                            ? const Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 18,
                                              )
                                            : const SizedBox(),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: defaultSubtitleTextOne(
                                            context: context,
                                            text:
                                                '${AppLocalizations.of(context).trans('terms_agree')}',
                                            color: Colors.grey[500])),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          _isSubmitting
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: SpinKitWave(
                                    color: Theme.of(context).primaryColor,
                                    size: 35,
                                  ),
                                )
                              : defaultButton(
                                  text:
                                      '${AppLocalizations.of(context).trans('next')}',
                                  function: () {
                                    if (_formKey.currentState.validate()) {
                                      print(phoneController.text);
                                      print(passwordController.text);
                                    }
                                    navigateTo(
                                        context, StepTwoInRegisterScreen());
                                  },
                                ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class StepTwoInRegisterScreen extends StatefulWidget {
  @override
  _StepTwoInRegisterScreenState createState() =>
      _StepTwoInRegisterScreenState();
}

class _StepTwoInRegisterScreenState extends State<StepTwoInRegisterScreen> {
  bool _isSubmitting = false;
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
  bool _accountNameValidator = false;
  bool _registeredPhoneValidator = false;
  bool _bankNameValidator = false;
  bool _accountNumberValidator = false;
  bool _paymentNumberValidator = false;

  var accountNameController = TextEditingController();
  var registeredPhoneController = TextEditingController();
  var bankNameController = TextEditingController();
  var accountNumberController = TextEditingController();
  var paymentNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
        appBar: defaultAppBar(context: context, titleKey: 'regist'),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: defaultColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          )),
                      child: Center(
                          child: Text(
                        '2',
                        style: Theme.of(context).textTheme.headline3,
                      )),
                    ),
                    title: Text(
                      '${AppLocalizations.of(context).trans('bank_account_information')}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    subtitle: Text(
                      '${AppLocalizations.of(context).trans('step2_of_3')}',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('account_holders_name')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          defaultFormField(
                            controller: accountNameController,
                            type: TextInputType.text,
                            validate: (val) {
                              if (val == null || val.isEmpty) {
                                setState(() {
                                  _accountNameValidator = true;
                                });
                              } else {
                                setState(() {
                                  _accountNameValidator = false;
                                });
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                _accountNameValidator = false;
                              });
                            },
                          ),
                          _accountNameValidator
                              ? Align(
                                  alignment: AppLocalizations.of(context)
                                              .locale
                                              .languageCode ==
                                          "en"
                                      ? Alignment.centerRight
                                      : Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      AppLocalizations.of(context)
                                                  .locale
                                                  .languageCode ==
                                              "en"
                                          ? 'Please Enter Account Name'
                                          : 'من فضلك ادخل اسم صاحب الحساب',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('registered_mobile_number')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          defaultFormField(
                            controller: registeredPhoneController,
                            type: TextInputType.text,
                            validate: (val) {
                              if (val == null || val.isEmpty) {
                                setState(() {
                                  _registeredPhoneValidator = true;
                                });
                              } else {
                                setState(() {
                                  _registeredPhoneValidator = false;
                                });
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                _registeredPhoneValidator = false;
                              });
                            },
                          ),
                          _registeredPhoneValidator
                              ? Align(
                                  alignment: AppLocalizations.of(context)
                                              .locale
                                              .languageCode ==
                                          "en"
                                      ? Alignment.centerRight
                                      : Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      AppLocalizations.of(context)
                                                  .locale
                                                  .languageCode ==
                                              "en"
                                          ? 'please Enter Registered Mobile Number'
                                          : 'من فضلك ادخل رقم الجوال المسجل',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('bank_name')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          defaultFormField(
                            controller: bankNameController,
                            type: TextInputType.text,
                            validate: (val) {
                              if (val == null || val.isEmpty) {
                                setState(() {
                                  _bankNameValidator = true;
                                });
                              } else {
                                setState(() {
                                  _bankNameValidator = false;
                                });
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                _bankNameValidator = false;
                              });
                            },
                          ),
                          _bankNameValidator
                              ? Align(
                                  alignment: AppLocalizations.of(context)
                                              .locale
                                              .languageCode ==
                                          "en"
                                      ? Alignment.centerRight
                                      : Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      AppLocalizations.of(context)
                                                  .locale
                                                  .languageCode ==
                                              "en"
                                          ? 'Please Enter Bank Name'
                                          : 'من فضلك ادخل اسم البنك',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('account_number')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          defaultFormField(
                            controller: accountNumberController,
                            type: TextInputType.text,
                            validate: (val) {
                              if (val == null || val.isEmpty) {
                                setState(() {
                                  _accountNumberValidator = true;
                                });
                              } else {
                                setState(() {
                                  _accountNumberValidator = false;
                                });
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                _accountNumberValidator = false;
                              });
                            },
                          ),
                          _accountNumberValidator
                              ? Align(
                                  alignment: AppLocalizations.of(context)
                                              .locale
                                              .languageCode ==
                                          "en"
                                      ? Alignment.centerRight
                                      : Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      AppLocalizations.of(context)
                                                  .locale
                                                  .languageCode ==
                                              "en"
                                          ? 'Please Enter Account Number'
                                          : 'من فضلك ادخل رقم الحساب',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('payment_number')}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          defaultFormField(
                            controller: paymentNumberController,
                            type: TextInputType.text,
                            validate: (val) {
                              if (val == null || val.isEmpty) {
                                setState(() {
                                  _paymentNumberValidator = true;
                                });
                              } else {
                                setState(() {
                                  _paymentNumberValidator = false;
                                });
                              }
                              return null;
                            },
                            onTap: () {
                              setState(() {
                                _paymentNumberValidator = false;
                              });
                            },
                          ),
                          _paymentNumberValidator
                              ? Align(
                                  alignment: AppLocalizations.of(context)
                                              .locale
                                              .languageCode ==
                                          "en"
                                      ? Alignment.centerRight
                                      : Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      AppLocalizations.of(context)
                                                  .locale
                                                  .languageCode ==
                                              "en"
                                          ? 'Please Enter Payment Number'
                                          : 'من فضلك ادخل رقم السداد',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              defaultButton(
                                text:
                                    '${AppLocalizations.of(context).trans('next')}',
                                function: () {
                                  if (_formKey.currentState.validate()) {}
                                  navigateTo(
                                      context, StepThreeInRegisterScreen());
                                },
                                width: media.width * 0.4,
                              ),
                              defaultButton(
                                  text:
                                      '${AppLocalizations.of(context).trans('back')}',
                                  function: () {
                                    Navigator.of(context).pop();
                                  },
                                  width: media.width * 0.4,
                                  background: Colors.grey[300]),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class StepThreeInRegisterScreen extends StatefulWidget {
  @override
  _StepThreeInRegisterScreenState createState() =>
      _StepThreeInRegisterScreenState();
}

class _StepThreeInRegisterScreenState extends State<StepThreeInRegisterScreen> {
  final ImagePicker _picker = ImagePicker();
  List<File> _certificatesImgListFile = [];

  Future<void> _getImage(ImageSource source, BuildContext context) async {
    await _picker
        .pickImage(source: source, maxWidth: 400.0)
        .then((XFile image) {
      if (image != null) {
        File x = File(image.path);
        setState(() {
          _certificatesImgListFile.add(x);
        });
        Navigator.pop(context);
      }
    });
  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.16
                : MediaQuery.of(context).size.height * 0.28,
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Text(
                  AppLocalizations.of(context).locale.languageCode == "en"
                      ? 'Pick an Image'
                      : 'التقط صوره',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: defaultColor)),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton.icon(
                    icon: ImageIcon(AssetImage('images/camera.png'),
                        color: Colors.white),
                    style: TextButton.styleFrom(
                      backgroundColor: defaultColor,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    label: Text(
                        AppLocalizations.of(context).locale.languageCode == "en"
                            ? 'Use Camera'
                            : 'استخدم الكاميرا',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.white)),
                    onPressed: () {
                      _getImage(ImageSource.camera, context);
                      // Navigator.of(context).pop();
                    },
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: defaultColor,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    icon: Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                    label: Text(
                        AppLocalizations.of(context).locale.languageCode == "en"
                            ? 'Use Gallery'
                            : 'استخدم المعرض',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.white)),
                    onPressed: () {
                      _getImage(ImageSource.gallery, context);
                    },
                  ),
                ],
              )
            ]),
          );
        });
  }

  Widget addPhotoWidget(Size media) => DottedBorder(
        radius: Radius.circular(
          15,
        ),
        dashPattern: [
          6,
        ],
        borderType: BorderType.RRect,
        padding: EdgeInsets.all(1.0),
        color: Colors.grey[400],
        child: Container(
          width: double.infinity,
          child: MaterialButton(
              onPressed: () {
                _openImagePicker(context);
              },
              child: Center(
                child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[400], width: 3)
                        //color: Colors.grey[300],
                        ),
                    child: Icon(Icons.add, color: Colors.grey[500])),
              )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
            color: Colors.grey[100],
          ),
        ),
      );

  Widget createImageCard(Size media, int index) => Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15.0,
              ),
              color: Colors.grey[300],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.file(
                  _certificatesImgListFile[index],
//                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _certificatesImgListFile.removeAt(index);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'images/deleteIcon.png',
                  fit: BoxFit.fill,
                  width: 15,
                  height: 15,
                ),
              ),
            ),
          ),
        ],
      );


  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: defaultAppBar(context: context, titleKey: 'regist'),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  SizedBox(
                    height: media.height*0.86,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: defaultColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  )),
                              child: Center(
                                  child: Text(
                                '3',
                                style: Theme.of(context).textTheme.headline3,
                              )),
                            ),
                            title: Text(
                              '${AppLocalizations.of(context).trans('certificates2')}',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            subtitle: Text(
                              '${AppLocalizations.of(context).trans('step3_of_3')}',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          _certificatesImgListFile.length == 0
                              ? DottedBorder(
                                  radius: Radius.circular(
                                    15,
                                  ),
                                  dashPattern: [
                                    6,
                                  ],
                                  borderType: BorderType.RRect,
                                  padding: EdgeInsets.all(0.0),
                                  color: Colors.grey[400],
                                  child: Container(
                                    width: media.width * 0.81,
                                    height: media.height * 0.18,
                                    child: MaterialButton(
                                        onPressed: () {
                                          _openImagePicker(context);
                                        },
                                        child: Center(
                                          child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.grey[400], width: 3)
                                                  //color: Colors.grey[300],
                                                  ),
                                              child: Icon(Icons.add,
                                                  color: Colors.grey[500])),
                                        )),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        15.0,
                                      ),
                                      color: Colors.grey[100],
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1.2,
                                          crossAxisSpacing: 8.0,
                                          mainAxisSpacing: 8.0),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: _certificatesImgListFile.length + 1,
                                  itemBuilder: (context, index) {
                                    int lastIndex = index + 1;
                                    if (lastIndex ==
                                        (_certificatesImgListFile.length + 1)) {
                                      return addPhotoWidget(media);
                                    }
                                    return createImageCard(media, index);
                                  }),

                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          defaultButton(
                            text:
                            '${AppLocalizations.of(context).trans('register')}',
                            function: () {
                              navigateAndFinish(context, VerificationTrainerData());
                            },
                            width: media.width * 0.4,
                          ),
                          defaultButton(
                              text: '${AppLocalizations.of(context).trans('back')}',
                              function: () {
                                Navigator.of(context).pop();
                              },
                              width: media.width * 0.4,
                              background: Colors.grey[300]),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
