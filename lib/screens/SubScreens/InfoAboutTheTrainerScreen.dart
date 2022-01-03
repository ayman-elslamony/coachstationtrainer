import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

class InfoAboutTheTrainerScreen extends StatefulWidget {
  @override
  _InfoAboutTheTrainerScreenState createState() => _InfoAboutTheTrainerScreenState();
}

class _InfoAboutTheTrainerScreenState extends State<InfoAboutTheTrainerScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 25.0),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey[300],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(40.0),
                            )),
                        child: Center(
                            child: Text(
                          '43',
                          style: TextStyle(
                              fontFamily: 'CairoBold',
                              color: Colors.grey[800],
                              fontSize: 22),
                        )),
                      ),
                      SizedBox(),
                      defaultSubtitleTextTwo(
                        context: context,
                        text: '${AppLocalizations.of(context).trans('age')}',
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 60,
                    color: Colors.grey[300],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: ClipOval(
                          child: Image.asset(
                            'images/allah.png',
                            fit: BoxFit.cover,
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ),
                      defaultSubtitleTextTwo(
                        context: context,
                        text:
                            '${AppLocalizations.of(context).trans('national')}',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: media.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey[300],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    )),
                child: Column(
                  children: [
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0))),
                      child: Center(
                        child: Text(
                          '${AppLocalizations.of(context).trans('certificates')}',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Colors.white
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Container(
                              height: 41,
                              child: Center(
                                child: Text('Advance Certification DRT And NDR',
                                    style:
                                        Theme.of(context).textTheme.headline2),
                              ),
                            ),
                        separatorBuilder: (context, index) => Divider(
                              height: 2.0,
                              color: Colors.grey[300],
                            ),
                        itemCount: 4)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: media.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey[300],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    )),
                child: Column(
                  children: [
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0))),
                      child: Center(
                        child: Text(
                          '${AppLocalizations.of(context).trans('information_about_the_coach')}',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, right: 12.0, left: 12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                                'Advance Certification DRT And NDR Advance Certification DRT And NDR Advance Certification DRT And NDR Advance Certification DRT And NDR Advance Certification DRT And NDR Advance Certification DRT And NDR Advance Certification DRT And NDR ',
                                style: Theme.of(context).textTheme.headline2,
                              maxLines: 5,
                              overflow:  TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
