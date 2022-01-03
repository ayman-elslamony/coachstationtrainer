import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

class DetailsOfOneClassScreen extends StatefulWidget {
  @override
  _DetailsOfOneClassScreenState createState() =>
      _DetailsOfOneClassScreenState();
}

class _DetailsOfOneClassScreenState extends State<DetailsOfOneClassScreen> {
  Widget headersWithIcon({
    @required BuildContext context,
    String iconUrl='',
    String titleKey,
    String subtitleText,
  }) {
    return ListTile(
      leading: iconUrl==''?SizedBox():ImageIcon(
        AssetImage(iconUrl),
        size: 16,
        color: Colors.red,
      ),
      horizontalTitleGap: -8,
      title: Text(
        '${AppLocalizations.of(context).trans(titleKey)}',
        style: Theme.of(context).textTheme.headline3,
      ),
      isThreeLine: true,
      contentPadding: EdgeInsets.only(right: 8),
      subtitle: Text(
        subtitleText,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontFamily: 'CairoBold',
          fontSize: 12,
          height: 1.5,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: defaultAppBar(
          context: context,
          titleKey: 'details',
        ),
        body: SingleChildScrollView(
          child: SizedBox(
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
                    height: 200,
                    width: 200,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'أحمد عبدالوهاب',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  margin: const EdgeInsets.only(
                      bottom: 12.0, left: 18.0, right: 18.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[300]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      )),
                  child: Column(
                    children: [
                      headersWithIcon(
                          context: context,
                          titleKey: 'training_type',
                          iconUrl: 'images/dambl.png',
                          subtitleText: 'تدريب منزلى'),
                      SizedBox(
                        height: 20.0,
                      ),
                      Divider(
                        color: Colors.grey[300],
                        height: 2.9,
                      ),
                      headersWithIcon(
                          context: context,
                          titleKey: 'address',
                          iconUrl: 'images/locationMark.png',
                          subtitleText: 'جولدز جيم - الرياض'),
                      SizedBox(
                        height: 20.0,
                      ),
                      Divider(
                        color: Colors.grey[300],
                        height: 2.9,
                      ),
                      headersWithIcon(
                          context: context,
                          titleKey: 'training_days',
                          iconUrl: 'images/calendar.png',
                          subtitleText: 'السبت - الأربعاء'),
                      SizedBox(
                        height: 2.0,
                      ),
                      Divider(
                        color: Colors.grey[300],
                        height: 2.9,
                      ),
                      headersWithIcon(
                          context: context,
                          titleKey: 'time',
                          iconUrl: 'images/clock.png',
                          subtitleText: '3:20 عصرا'),
                      SizedBox(
                        height: 2.0,
                      ),
                      Divider(
                        color: Colors.grey[300],
                        height: 2.9,
                      ),
                      headersWithIcon(
                          context: context,
                          titleKey: 'reservation_type',
                          iconUrl: '',
                          subtitleText: 'جماعى - 3 افراد'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    defaultButton(
                      text: '${AppLocalizations.of(context).trans('done')}',
                      function: () {},
                      width: media.width * 0.4,
                    ),
                    defaultButton(
                        text: '${AppLocalizations.of(context).trans('delay')}',
                        function: () {
                          Navigator.of(context).pop();
                        },
                        width: media.width * 0.4,
                        background: Colors.grey[300]),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ));
  }
}
