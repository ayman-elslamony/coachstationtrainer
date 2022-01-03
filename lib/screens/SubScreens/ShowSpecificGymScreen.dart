import 'package:carousel_slider/carousel_slider.dart';
import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:coachstationtrainer/provider/changeIndexPage.dart';
import 'package:coachstationtrainer/screens/MainScreens/NavigationHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'InfoAboutTheTrainerScreen.dart';
import 'TrainerProfileScreen.dart';
import 'TrainingPlacesScreen.dart';

class ShowSpecificGymScreen extends StatefulWidget {
  @override
  _ShowSpecificGymScreenState createState() => _ShowSpecificGymScreenState();
}

class _ShowSpecificGymScreenState extends State<ShowSpecificGymScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
int subscriptionsResult = 0;
  Widget socialMediaWidget({String urlImg, Function function,bool enableColor=false}) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: CircleAvatar(
          radius: 20,
          child: ClipOval(
            child: Image.asset(
              urlImg,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
              color: enableColor==true?defaultColor:null,
            ),
          ),
        ),
      ),
    );
  }
void getSubscriptionsResult(int selectSubscriptions){
    setState(() {
      subscriptionsResult = selectSubscriptions;
    });
}
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const ImageIcon(
                AssetImage(
                  'images/arrowLeft.png',
                ),
                size: 16,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    SizedBox(height: 12.0,),
                    CarouselSlider(
                      carouselController: _controller,
                      items: imgList
                          .map((item) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    child: Image.network(item,
                                        fit: BoxFit.cover, width: 1000.0)),
                              ))
                          .toList(),
                      options: CarouselOptions(
                          height: 200,
                          viewportFraction: 1.0,
                          enlargeCenterPage: false,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(seconds: 1),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 11.0,
                            height: 11.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ( Theme.of(context).accentColor)
                            .withOpacity(
                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gold Gym',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 4,
                                    minRating: 1,
                                    itemSize: 15,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 4,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => ImageIcon(
                                      AssetImage('images/star.png'),
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    myDivider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        socialMediaWidget(
                            function: () {}, urlImg: 'images/call.png',enableColor: true),
                        socialMediaWidget(
                            function: () {}, urlImg: 'images/whatapp.png'),
                        socialMediaWidget(
                            function: () {}, urlImg: 'images/snap.png'),
                        socialMediaWidget(
                            function: () {}, urlImg: 'images/tiktok.png'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: AppBar(
                  bottom: TabBar(
                    isScrollable: true,
                    labelColor: Theme.of(context).primaryColor,
                    indicatorColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.white,
//                    labelColor: Theme.of(context).primaryColor,
                    tabs: [
                      Tab(
                        text: '${AppLocalizations.of(context).trans('brief')}',
                      ),
                      Tab(
                        text:
                            '${AppLocalizations.of(context).trans('coaches')}',
                      ),
                      Tab(
                        text:
                            '${AppLocalizations.of(context).trans('addresses')}',
                      ),
                      Tab(
                        text:
                            '${AppLocalizations.of(context).trans('subscriptions')}',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: media.height,
                width: media.width,
                child: TabBarView(
                  children: [
                    BriefAboutGym(),
                    AllCoachesInGym(),
                    AddressesForGym(),
                    SubscriptionsInGym(
                      programTypeResult: subscriptionsResult,
                      selectSubscriptions: getSubscriptionsResult,
                    )
                  ],
                ),
              ),
            ],
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
      ),
    );
  }
}

class BriefAboutGym extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            'عن Gold Gym',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            width: media.width,
            child: Text(
              ' لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline2
            ),
          ),
        ],
      ),
    );
  }
}

class AllCoachesInGym extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => defaultTrainerCard(
            onTap: () {
              navigateTo(context, TrainerProfileScreen());
            },
            context: context),
        itemCount: 9,
      ),
    );
  }
}

class AddressesForGym extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(11.0)),
                    border: Border.all(color: Colors.grey[300])),
                child: Column(
                  children: [
                    SizedBox(
                      width: media.width,
                      child: Text(
                        ' لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى  لقم تم توليد هذا النص من مولد النص العربى',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline2
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        defaultLocationWithIcon(
                            context: context, textLocation: 'الرياض'),
                      ],
                    )
                  ],
                ),
              ),
            )),
        itemCount: 9,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class SubscriptionsInGym extends StatefulWidget {
  int programTypeResult;
  Function selectSubscriptions;

  SubscriptionsInGym({this.programTypeResult,this.selectSubscriptions});
  @override
  _SubscriptionsInGymState createState() => _SubscriptionsInGymState();
}

class _SubscriptionsInGymState extends State<SubscriptionsInGym> {

  Widget showSubscriptionsCard({
    BuildContext context,
    int index,
    String titleKey,
    String prefixTitle,
    String postfixTitle,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.grey[300]),
        child: RadioListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          activeColor: Theme.of(context).primaryColor,
          title: Text(
            '${AppLocalizations.of(context).trans(titleKey)}',style: Theme.of(context).textTheme.headline3,),
          subtitle: Row(
            children: [
              Text(
                postfixTitle,
                style: Theme.of(context).textTheme.headline3.copyWith(color: Theme.of(context).primaryColor),
              ),
              defaultSubtitleTextTwo(
                  context: context,
                  text: '  ${AppLocalizations.of(context).trans('instead_of')}  '),
              Text(
                prefixTitle,
                style: Theme.of(context).textTheme.headline3.copyWith(
                    decoration: TextDecoration.lineThrough,
                  color: Colors.grey
                ),
              ),
            ],
          ),
          value: index,
          groupValue: widget.programTypeResult,
          onChanged: (value) {
            setState(() {
              print(value);
              widget.selectSubscriptions(value);
              widget.programTypeResult = value;
            });
          }, //  <-- leading Checkbox
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
          color: Colors.white,
          border: Border.all(color: Colors.grey[300])),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15,),
            Text(
              '${AppLocalizations.of(context).trans('subscribe_through_the_app_and_get_the_discount')}',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 10.0,
            ),
            showSubscriptionsCard(
                context: context,
                index: 1,
                titleKey: 'by_share',
                prefixTitle: '30 رس',
                postfixTitle: '50 رس'),
            showSubscriptionsCard(
                context: context,
                index: 2,
                titleKey: 'Monthly',
                prefixTitle: '90 رس',
                postfixTitle: '120 رس'),
            showSubscriptionsCard(
                context: context,
                index: 3,
                titleKey: 'three_months',
                prefixTitle: '100 رس',
                postfixTitle: '150 رس'),

          ],
        ),
      ),
    );
  }
}
