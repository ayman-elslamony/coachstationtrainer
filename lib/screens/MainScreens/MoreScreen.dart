import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:coachstationtrainer/provider/changeIndexPage.dart';
import 'package:coachstationtrainer/screens/SubScreens/ChangeLanguageScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  Widget showMoreInfoCard(
      {BuildContext context, String title, String imgUrl, Function onTap}) {


    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          child:     ListTile(
              leading: ImageIcon(
                AssetImage(
                  imgUrl,
                ),
                color: Theme.of(context).primaryColor,
              ),
              title: defaultSubtitleTextOne(
                context: context,
                text: title,
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              '${AppLocalizations.of(context).trans('more')}',
            ),
            titleSpacing: 2.0,
          ),
          SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                'عادل أحمد',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      //navigateTo(context, PersonalPageScreen());
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 0.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        child: ListTile(
                            leading: CircleAvatar(
                              radius: 15,
                              child: ClipOval(
                                child: Image.asset(
                                  'images/userProfile.png',
                                  fit: BoxFit.cover,
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                            title: defaultSubtitleTextOne(
                              context: context,
                              text:
                                  '${AppLocalizations.of(context).trans('personal_page')}',
                            ))),
                  ),
                  Consumer<ChangeIndex>(
builder: (context, changeIndex, child) =>(
                     showMoreInfoCard(
                      onTap: (){
                        changeIndex.changeIndexFunction(2);
                      },
                        context: context,
                        imgUrl: 'images/greyCoaches.png',
                        title:
                            '${AppLocalizations.of(context).trans('trainer')}'))
                  ),
                  showMoreInfoCard(
                    onTap: (){
               //       navigateTo(context, VirtualExercise());
                    },
                      context: context,
                      imgUrl: 'images/dumble.png',
                      title:
                          '${AppLocalizations.of(context).trans('virtual_exercise')}'),
                  showMoreInfoCard(
                    onTap: (){
                    // navigateTo(context, HomeWorkoutScreen());
                    },
                      context: context,
                      imgUrl: 'images/home.png',
                      title:
                          '${AppLocalizations.of(context).trans('home_workout')}'),
                  showMoreInfoCard(
                    onTap: (){
                  //    navigateTo(context, NutritionalProgramsDetailsScreen());
                    },
                      context: context,
                      imgUrl: 'images/food.png',
                      title:
                          '${AppLocalizations.of(context).trans('nutritional_programs')}'),
                  showMoreInfoCard(
                    onTap: (){
                     // navigateTo(context, MyProgramScreen());
                    },
                      context: context,
                      imgUrl: 'images/fileSilver.png',
                      title:
                          '${AppLocalizations.of(context).trans('my_program')}'),
                  showMoreInfoCard(
                      onTap: (){
                      //  navigateTo(context, AllTrainingProgramsScreen());
                      },
                      context: context,
                      imgUrl: 'images/fileSilver.png',
                      title:
                      '${AppLocalizations.of(context).trans('training_programs')}'),
                  Consumer<ChangeIndex>(
                      builder: (context, changeIndex, child) =>(
                          showMoreInfoCard(
                              onTap: (){
                                changeIndex.changeIndexFunction(3);
                              },
                              context: context,
                              imgUrl: 'images/heart.png',
                              title:
                              '${AppLocalizations.of(context).trans('favourite')}'))
                  ),
                  showMoreInfoCard(
                      context: context,
                      imgUrl: 'images/contact.png',
                      title:
                          '${AppLocalizations.of(context).trans('call_us')}'),
                  showMoreInfoCard(
                    onTap: (){
                      navigateTo(context, ChangeLanguageScreen());
                    },
                      context: context,
                      imgUrl: 'images/language.png',
                      title:
                          '${AppLocalizations.of(context).trans('language')}'),
                  showMoreInfoCard(
                      context: context,
                      imgUrl: 'images/logout.png',
                      title: '${AppLocalizations.of(context).trans('logout')}'),
                ],
              ),
              //TODO: remember fix
              SizedBox(
                height: 65,
              )
            ],
          )),
        ],
      ),
    );
  }
}
