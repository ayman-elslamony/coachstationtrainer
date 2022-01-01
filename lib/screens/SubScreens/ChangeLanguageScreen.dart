import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:coachstationtrainer/provider/changeIndexPage.dart';
import 'package:coachstationtrainer/screens/MainScreens/NavigationHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';

class ChangeLanguageScreen extends StatefulWidget {
  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  List<int> listVal =[0,1];
  int val = 0;
  Widget checkedBoxCard(
      {BuildContext context, String text, int index}) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
          border: Border.all(color: Colors.grey[300])),
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.grey[300]),
        child: RadioListTile(
          contentPadding: EdgeInsets.all(2.0),
          activeColor: Theme.of(context).primaryColor,
          title: defaultSubtitleTextOne(context: context, text: text),
          value: index,
          groupValue: val,
          onChanged: (value) {
            setState(() {
              print(value);
              val = value;
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
      appBar: defaultAppBar(context: context,
        titleKey: 'language',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Image.asset(
                'images/language.png',
                color: Theme.of(context).primaryColor,
                fit: BoxFit.fill,
                height: media.height*0.18,
                width: media.width*0.29,
              ),
              SizedBox(height: 80.0,),
              checkedBoxCard(
                  context: context,
                  text: 'English',
                  index: listVal[0]
              ),
              SizedBox(height: 8.0,),
              checkedBoxCard(
                  context: context,
                  text: 'عربى',
                  index: listVal[1]
              ),

            ],
          ),
        ),
      ),
        bottomNavigationBar:  Consumer<ChangeIndex>(
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
