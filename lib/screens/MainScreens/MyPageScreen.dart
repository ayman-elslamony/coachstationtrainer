import 'package:carousel_slider/carousel_slider.dart';
import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:coachstationtrainer/provider/changeIndexPage.dart';
import 'package:coachstationtrainer/screens/MainScreens/NavigationHome.dart';
import 'package:coachstationtrainer/screens/SubScreens/EditProfileScreen.dart';
import 'package:coachstationtrainer/screens/SubScreens/InfoAboutTheTrainerScreen.dart';
import 'package:coachstationtrainer/screens/SubScreens/TrainingPlacesScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class MyPageScreen extends StatefulWidget {
  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  Widget socialMediaWidget({String urlImg, Function function}) {
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
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
              slivers: [
              SliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.0,
                      ),
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
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).accentColor)
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
                                  'أنس حافظ',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                defaultSubtitleTextTwo(
                                    context: context, text: 'مدرب كراتية'),
                                SizedBox(
                                  height: 5,
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
                                    Spacer(),
                                    defaultLocationWithIcon(context: context,textLocation: 'الرياض')
                                  ],
                                )
                              ],
                            ),
                          ),
//                        Container(
//                          width: 70,
//                          height: 38.0,
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(
//                              12.0,
//                            ),
//                            color: d,
//                          ),
//                          child: Icon(
//                            Icons.favorite_border,
//                            color: defaultColor,
//                          ),
//                        )
                          Container(
//                          width: media.width*0.2,
                            height: 32,
                            width: 90,
                            child: MaterialButton(
                              onPressed: (){
                                navigateTo(context, EditProfileScreen());
                              },
                              child: Text('${AppLocalizations.of(context).trans('edit')}'
                                ,
                                style: TextStyle(
                                  fontFamily: 'Cairobold',
                                  color: Colors.grey[800],
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                              color: defaultColor,
                            ),
                          )
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
                              function: () {}, urlImg: 'images/tiktok.png'),
                          socialMediaWidget(
                              function: () {}, urlImg: 'images/insta.png'),
                          socialMediaWidget(
                              function: () {}, urlImg: 'images/snap.png'),
                          socialMediaWidget(
                              function: () {}, urlImg: 'images/whatapp.png'),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(height: 50,
                width: media.width,
                color: Theme.of(context).accentColor,
                child: Center(
                  child: TabBar(
                    isScrollable: true,
                    labelColor: Theme.of(context).primaryColor,
                    indicatorColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.white,
//                    labelColor: Theme.of(context).primaryColor,
                    tabs: [
                      Tab(
                        text:
                        '${AppLocalizations.of(context).trans('about_the_coach')}',
                      ),
                      Tab(
                        text:
                        '${AppLocalizations.of(context).trans('training_places')}',
                      ),
                    ],
                  ),
                ),),
                SizedBox(
                  width: media.width,
                  height: media.height,
                  child: TabBarView(
                    children: [
                      InfoAboutTheTrainerScreen(),
                      TrainingPlacesScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),

            ],
          ),
        ),
    );
  }
}
