import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

import 'Verification.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var phoneController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool _phoneValidator = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: defaultAppBar(context: context,
          titleKey: 'new_password',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Image.asset(
                'images/password.png',
                color: Theme.of(context).primaryColor,
                fit: BoxFit.fill,
                height: media.height*0.16,
                width: media.width*0.24,
              ),
              SizedBox(height: 70,),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${AppLocalizations.of(context).trans('phone_num')}',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(height: 8.0,),
                      defaultFormField(
                        onTap: (){
                          setState(() {
                            _phoneValidator =false;
                          });
                        },
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (String val) {
                          if(val == null || val.isEmpty){
                            setState(() {
                              _phoneValidator =true;
                            });
                          }
                          else{
                            setState(() {
                              _phoneValidator =false;
                            });
                          }
                          return null;

                          // if (value.isEmpty) {
                          //   return '${AppLocalizations.of(context).trans('invalid_phone_num')}';
                          // }

                        },
                      ),
                      _phoneValidator ? Align(
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              defaultButton(
                  function: () {
                    navigateTo(context, Verification());
                  },
                  text: '${AppLocalizations.of(context).trans('send')}',
                  width: media.width * 0.7),
            ],
          ),
        )
    );
  }
}
