import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:coachstationtrainer/screens/SubScreens/TrainerProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class IndebtednessScreen extends StatefulWidget {
  @override
  _IndebtednessScreenState createState() => _IndebtednessScreenState();
}

class _IndebtednessScreenState extends State<IndebtednessScreen> {
  Widget showIconText({
    @required BuildContext context,
    String iconUrl,
    String titleText,
  }) {
    return Row(
      children: [
        ImageIcon(
          AssetImage(iconUrl),
          size: 15,
          color: Colors.amber,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          titleText,
          style: TextStyle(
            fontFamily: 'CairoBold',
            fontSize: 14,
            height: 1.6,
            color: Colors.grey[800],
          ),
        )
      ],
    );
  }

  Widget buttonWidget({
    double width = double.infinity,
    Color background = defaultColor,
    double radius = 15.0,
    @required Function function,
    @required String textTitle,
    Color textTitleColor = Colors.white,
    Color subTitleTextColor = Colors.white,
    @required String subTitleText,
  }) {
    return Container(
      height: 120.0,
      child: MaterialButton(
        onPressed: function,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textTitle,
              style: TextStyle(
                fontFamily: 'Cairobold',
                color: textTitleColor,
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              subTitleText,
              style: TextStyle(
                fontFamily: 'Cairobold',
                color: subTitleTextColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              bottom: TabBar(
                labelColor: Theme.of(context).primaryColor,
                indicatorColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(
                    text: '${AppLocalizations.of(context).trans('dues')}',
                  ),
                  Tab(
                    text:
                        '${AppLocalizations.of(context).trans('expired_dues')}',
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: media.width,
                height: media.height,
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 15),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.only(bottom: 12.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(11.0)),
                                  border: Border.all(color: Colors.grey[300])),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      showIconText(
                                        context: context,
                                        iconUrl: 'images/hash.png',
                                        titleText: '42586374',
                                      ),
                                      showIconText(
                                          context: context,
                                          iconUrl: 'images/locationMark.png',
                                          titleText: 'جولدز جيم الرياض'),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      showIconText(
                                        context: context,
                                        iconUrl: 'images/user.png',
                                        titleText: '42586374',
                                      ),
                                      showIconText(
                                          context: context,
                                          iconUrl: 'images/dollar.png',
                                          titleText: '100 ر.س'),
                                    ],
                                  ),
                                  SizedBox()
                                ],
                              ),
                            ),
                            itemCount: 7,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: media.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: buttonWidget(
                                      function: null,
                                      textTitle: '10',
                                      subTitleText:
                                          '${AppLocalizations.of(context).trans('total_number_of_orders')}',
                                      background: defaultColor,
                                      textTitleColor:
                                          Theme.of(context).accentColor,
                                      subTitleTextColor: Colors.grey[800],
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  Expanded(
                                    flex: 1,
                                    child: buttonWidget(
                                      function: null,
                                      textTitle: '250',
                                      subTitleText:
                                          '${AppLocalizations.of(context).trans('gross_profit')}',
                                      background: Colors.green,
                                      textTitleColor:
                                          Colors.white,
                                      subTitleTextColor: Colors.grey[300],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: media.height*0.3,)
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12.0),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(11.0)),
                            border: Border.all(color: Colors.grey[300])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                showIconText(
                                  context: context,
                                  iconUrl: 'images/hash.png',
                                  titleText: '42586374',
                                ),
                                showIconText(
                                    context: context,
                                    iconUrl: 'images/locationMark.png',
                                    titleText: 'جولدز جيم الرياض'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                showIconText(
                                  context: context,
                                  iconUrl: 'images/user.png',
                                  titleText: '42586374',
                                ),
                                showIconText(
                                    context: context,
                                    iconUrl: 'images/dollar.png',
                                    titleText: '100 ر.س'),
                              ],
                            ),
                            SizedBox()
                          ],
                        ),
                      ),
                      itemCount: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
