import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:coachstationtrainer/screens/MainScreens/NavigationHome.dart';
import 'package:flutter/material.dart';

class VerificationTrainerData extends StatefulWidget {
  @override
  _VerificationTrainerDataState createState() =>
      _VerificationTrainerDataState();
}

class _VerificationTrainerDataState extends State<VerificationTrainerData> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            height: media.height*0.92,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: media.height * 0.18,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'images/verified.png',
                        fit: BoxFit.fill,
                        height: media.height * 0.35,
                        width: media.width * 0.7,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '${AppLocalizations.of(context).trans('your_data_has_been_successfully_registered')}',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.grey[700]),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: media.width,
                      child: Text(
                        '${AppLocalizations.of(context).trans('the_data_will_be_verified_and_account_activated')}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'CairoRegular',
                          fontSize: 14,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          defaultButton(
            text: '${AppLocalizations.of(context).trans('home')}',
            function: () {
              navigateAndFinish(context,NavigationHome() );
            },
            width: media.width * 0.8,
          ),
        ],
      ),
    );
  }
}
