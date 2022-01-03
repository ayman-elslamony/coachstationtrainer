import 'package:carousel_slider/carousel_slider.dart';
import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:coachstationtrainer/screens/SubScreens/CompleteCoachDataScreen.dart';
import 'package:coachstationtrainer/screens/SubScreens/DetailsOfOneClassScreen.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> gymList = [
    'https://thumbs.dreamstime.com/t/gym-24699087.jpg',
    'https://media.istockphoto.com/photos/empty-gym-picture-id1132006407?k=20&m=1132006407&s=612x612&w=0&h=Z7nJu8jntywb9jOhvjlCS7lijbU4_hwHcxoVkxv77sg=',
    'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX26664924.jpg',
  ];
  final List<String> discoverList = [
    'https://media.istockphoto.com/photos/muscular-trainer-writing-on-clipboard-picture-id675179390?k=20&m=675179390&s=612x612&w=0&h=7LP7-OamGu-b8XG-VKcJuamK5s80ke-4oJ5siUrjFVA=',
    'https://www.muscleandfitness.com/wp-content/uploads/2019/11/Young-Muscular-Man-Doing-Lunges-In-Dark-Gym.jpg?w=1109&h=614&crop=1&quality=86&strip=all',
    'https://www.giggsmeat.com/wp-content/uploads/2020/10/4wqKj5zM2a-min.jpg',
  ];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // _locale = Provider.of<LocaleProvider>(context, listen: false).locale;
    // Provider.of<HomeProvider>(context,listen: false).clearTopOffers();
    // Provider.of<HomeProvider>(context,listen: false).clearLatestProducts();
    // Provider.of<HomeProvider>(context,listen: false).clearMaxSelling();
    // Provider.of<HomeProvider>(context,listen: false).getTopOffers(context: context,locale: _locale).then((_) {
    //   _topOffers = Provider.of<HomeProvider>(context,listen: false).topOffers;
    //   debugPrint(_topOffers.toString());
    // });
    // Provider.of<HomeProvider>(context,listen: false).getLatestProducts(context: context,locale: _locale).then((_) {
    //   _latestProducts = Provider.of<HomeProvider>(context,listen: false).latestProducts;
    //   debugPrint(_latestProducts.toString());
    // });
    // Provider.of<HomeProvider>(context,listen: false).getMaxSellingProducts(context: context,locale: _locale).then((_) {
    //   _maxSellingProducts = Provider.of<HomeProvider>(context,listen: false).latestProducts;
    //   debugPrint(_maxSellingProducts.toString());
    // });

    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SmartRefresher(
      enablePullDown: true,
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).accentColor,
            expandedHeight: 60,
            title: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${AppLocalizations.of(context).trans('welcome')}',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                      '${AppLocalizations.of(context).trans('captain')} أنس حافظ ',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(color: Colors.grey[500], height: 1)),
                ],
              ),
            ),
            centerTitle: false,
            leading: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                "images/coachStationWhiteIcon.png",
                width: 25,
                height: 25,
              ),
            ),
          ),
//          SliverToBoxAdapter(
//            child: Stack(
//              alignment: AlignmentDirectional.bottomCenter,
//              children: [
//                SizedBox(
//                  height: media.height * 0.68,
//                  child: Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                    child: SingleChildScrollView(
//                      child: Column(
//                        children: [
//                          SizedBox(
//                            height: media.height * 0.09,
//                          ),
//                          ClipRRect(
//                            borderRadius: BorderRadius.circular(10.0),
//                            child: Image.asset(
//                              'images/completeData.png',
//                              fit: BoxFit.fill,
//                              height: media.height * 0.28,
//                              width: media.width * 0.4,
//                            ),
//                          ),
//                          SizedBox(
//                            height: 20.0,
//                          ),
//                          Text(
//                            '${AppLocalizations.of(context).trans('the_account_has_been_activated')}',
//                            style: Theme.of(context)
//                                .textTheme
//                                .headline5
//                                .copyWith(color: Colors.grey[700]),
//                          ),
//                          SizedBox(
//                            height: 10.0,
//                          ),
//                          SizedBox(
//                            width: media.width,
//                            child: Text(
//                              '${AppLocalizations.of(context).trans('please_complete_your_data')}',
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                fontFamily: 'CairoRegular',
//                                fontSize: 14,
//                                color: Colors.grey[700],
//                                fontWeight: FontWeight.bold,
//                              ),
//                            ),
//                          ),
//                          SizedBox(
//                            height: 20.0,
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//                defaultButton(
//                  text:
//                      '${AppLocalizations.of(context).trans('completing_data')}',
//                  function: () {
//                    navigateTo(context, CompleteCoachDataStepOne());
//                  },
//                  width: media.width * 0.8,
//                ),
//              ],
//            ),
//          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${AppLocalizations.of(context).trans('list_of_classes')}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    width: media.width,
                    child: ListView.builder(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11.0)),
                              border: Border.all(color: Colors.grey[300])),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: ClipOval(
                                  child: Image.asset(
                                    "images/userProfile.png",
                                    fit: BoxFit.cover,
                                    width: 85,
                                    height: 85,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'أحمد عبد الوهاب',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          showTextWithIcon(
                                              context: context,
                                              iconUrl: 'images/homedColor.png',
                                              titleText: 'تدريب منزلى',
                                              colorOfWidget: Colors.amber),

                                          Container(
                                            height: 32,
                                            width: 90,
                                            child: MaterialButton(
                                              onPressed: () {
                                                 navigateTo(context, DetailsOfOneClassScreen());
                                              },
                                              child: Text(
                                                '${AppLocalizations.of(context).trans('details')}',
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
                                          ),
                                        ],
                                      ),
                                    ),
                                    showTextWithIcon(
                                        context: context,
                                        iconUrl: 'images/locationMark.png',
                                        titleText: 'جولدز جيم الرياض'),
                                    showTextWithIcon(
                                        context: context,
                                        iconUrl: 'images/clock.png',
                                        titleText: '3:20 عصرا'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 5.0),
                      shrinkWrap: true,
                      itemCount: 4,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
