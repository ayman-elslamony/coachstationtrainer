// ignore_for_file: file_names, unnecessary_this, unnecessary_string_interpolations, use_rethrow_when_possible, non_constant_identifier_names, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:coachstationtrainer/Helper/Helper.dart';

import 'package:coachstationtrainer/provider/locale_provider.dart';
import 'package:coachstationtrainer/screens/IntroScreens/LoginScreen.dart';
import 'package:coachstationtrainer/screens/IntroScreens/Verification.dart';
import 'package:coachstationtrainer/screens/MainScreens/NavigationHome.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routName = '/Splash_Screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool _isLoaderVisible = true;

  _makeLoaderVisible() {
    Future.delayed(Duration(milliseconds: 1000)).then((value) {
      setState(() {
        _isLoaderVisible = true;
      });
    });
  }

  _navigateToNextScreen() async{

    Timer(Duration(milliseconds: 3000), ()async{
      debugPrint(Helper.token.toString());
      if (Helper.token != null && Helper.is_verified == true){
        Navigator.push(context, PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => NavigationHome(),
          transitionDuration: Duration(milliseconds: 1000),
        ));
      }
      else{
        Navigator.push(context, PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => LoginScreen(),
          transitionDuration: Duration(milliseconds: 1000),
        ));
      }
    });
  }
  var _locale;
  String currentLanguage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _locale = Provider.of<LocaleProvider>(context,listen: false).locale.languageCode;
    // Provider.of<SettingsProvider>(context,listen: false).getSlides(context: context,locale: _locale);
//    Provider.of<UserDataProvider>(context,listen: false).getUserData().then((_){
//      _makeLoaderVisible();
//      _navigateToNextScreen();
//          Geolocator()
//      ..checkGeolocationPermissionStatus(
//          locationPermission: GeolocationPermission.location);
//    });
    _navigateToNextScreen();
  }
  

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: media.height,
            width: media.width,
            color: Colors.white,
            child: _isLoaderVisible
                ? Align(
              alignment: Alignment.bottomCenter,
              child: SpinKitFadingCube(
                color: Theme.of(context).primaryColor,
                size: 35.0,
              ),
            )
                : SizedBox(height: 25,),
          ),
        ),
      ],
    );
  }
}
