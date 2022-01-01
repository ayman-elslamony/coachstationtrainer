import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:coachstationtrainer/provider/changeIndexPage.dart';
import 'package:coachstationtrainer/screens/MainScreens/NavigationHome.dart';
import 'package:coachstationtrainer/screens/SubScreens/EditProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';

import 'ChangePasswordScreen.dart';

class PersonalPageScreen extends StatefulWidget {
  @override
  _PersonalPageScreenState createState() => _PersonalPageScreenState();
}

class _PersonalPageScreenState extends State<PersonalPageScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(context: context,
      titleKey: 'personal_page'),
      body: SingleChildScrollView(
        child:  SizedBox(
          width: media.width,
          child: Column(
            children: [
              SizedBox(
                height: 18.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'images/userProfile.png',
                  fit: BoxFit.fill,
                  height: media.height*0.35,
                  width: media.width*0.7,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'عادل أحمد',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 300,
                height: 60.0,
                child: MaterialButton(
                  onPressed: () {
                    navigateTo(context, EditProfileScreen());
                  },
                  child: Text(
                      '${AppLocalizations.of(context).trans('edit')}',
                      style: Theme.of(context).textTheme.headline3
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      18.0,
                    ),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[300])),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 300,
                height: 60.0,
                child: MaterialButton(
                  onPressed: () {
                    navigateTo(context, ChangePasswordScreen());
                  },
                  child: Text(
                      '${AppLocalizations.of(context).trans('change_pass')}',
                      style: Theme.of(context).textTheme.headline3
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      18.0,
                    ),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[300])),
              ),
              SizedBox(
                height: 65,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer<ChangeIndex>(
        builder: (context, changeIndex, child) =>bottomNavigationBar(
            context: context,
            onTap: (index){
              setState(() {
                changeIndex.index=index;
              });
              Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
                pageBuilder:
                    (context, animation1, animation2) =>
                    NavigationHome(),
                transitionDuration: Duration(seconds: 0),
              ),(Route<dynamic> route) => false);
            },
            media: media,
            currentIndex: changeIndex.index
        ),
      ),
    );
  }
}
