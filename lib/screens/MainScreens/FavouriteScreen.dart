import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:coachstationtrainer/provider/changeIndexPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  Widget trainerCard() {
    return InkWell(
        onTap: () {
      //   navigateTo(context, TrainerProfileScreen());
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(11.0)),
                border: Border.all(color: Colors.grey[300])),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 45,
                  child: ClipOval(
                    child: Image.asset(
                      "images/userProfile.png",
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'علاء صالح',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      defaultSubtitleTextTwo(
                          context: context, text: 'اللياقة والعلاج الطبيعى'),
                      SizedBox(height: 8.0,),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            itemSize: 15,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 4,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage('images/deleteIcon.png'),
                      color: Colors.red,
                      size: 18.0,
                    ))
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              title: Text(
                '${AppLocalizations.of(context).trans('favourite')}',
              ),
              titleSpacing: 2.0,
              bottom: TabBar(
                labelColor: Theme.of(context).primaryColor,
                indicatorColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(
                    text:
                        '${AppLocalizations.of(context).trans('trainers')}',
                  ),
                  Tab(
                    text:
                        '${AppLocalizations.of(context).trans('training_room')}',
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child:
              SizedBox(
                width: media.width,
                height: media.height,
                child: TabBarView(
                  children: [
                    ListView.builder(
                        padding: EdgeInsets.all(0.0),
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => trainerCard(),
                      itemCount: 7,
                    ),
                    ListView.builder(
                      padding: EdgeInsets.all(12.0),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Stack(
                        children: [
                          defaultCard(
                              function: () {},
                              context: context,
                              textTitle:
                                  '${AppLocalizations.of(context).trans('gyms')}',
                              imageUrl: imgList[index],
                              cardWidth: media.width,
                              containerTextWidth: media.width * 0.8,
                              cardHeight: 150),
                          Positioned(
                            child: InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 19,
                                  backgroundColor: Colors.white,
                                  child: ImageIcon(
                                    AssetImage('images/deleteIcon.png'),
                                    color: Colors.red,
                                    size: 18,
                                  )),
                            ),
                            top: 20.0,
                            left: 20.0,
                          )
                        ],
                      ),
                      itemCount: imgList.length,
                      scrollDirection: Axis.vertical,
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
