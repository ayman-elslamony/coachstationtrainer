import 'package:carousel_slider/carousel_slider.dart';
import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
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
            backgroundColor: Colors.transparent,
            expandedHeight: 60,
            title: Image.asset("images/appBarIcon.png",height: 40,),
            centerTitle: true,
            actions: [],
            leading: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset("images/appBarMenuIcon.png",height: 10,),
            ),
          ),
          SliverToBoxAdapter(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SizedBox(
                  height: media.height*0.68,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: media.height * 0.09,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'images/completeData.png',
                              fit: BoxFit.fill,
                              height: media.height * 0.28,
                              width: media.width * 0.4,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            '${AppLocalizations.of(context).trans('the_account_has_been_activated')}',
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
                              '${AppLocalizations.of(context).trans('please_complete_your_data')}',
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
                  text: '${AppLocalizations.of(context).trans('completing_data')}',
                  function: () {

                  },
                  width: media.width * 0.8,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
