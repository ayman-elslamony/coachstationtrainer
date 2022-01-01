import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:coachstationtrainer/provider/changeIndexPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TrainersScreen extends StatefulWidget {
  @override
  _TrainersScreenState createState() => _TrainersScreenState();
}

class _TrainersScreenState extends State<TrainersScreen> {
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
      child: Consumer<ChangeIndex>(
        builder: (context, changeIndex, child) => Scaffold(
          appBar: defaultAppBar(
              enableLeading: false,
              context: context,
              titleKey: 'trainer',
              automaticallyImplyLeading: false,
              onClickedBackButton: () {
                changeIndex.changeIndexFunction(0);
              },
              actions: [
                IconButton(
                    onPressed: () {
                     // navigateTo(context, FilterTrainerScreen());
                    },
                    icon: Image.asset("images/filter.png",color: Colors.white,height: 30)),
                IconButton(onPressed: () {}, icon: Image.asset("images/search.png",height: 20,)),
              ]),
          body: SizedBox(
            height: media.height,
            width: media.width,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView.builder(
                itemBuilder: (context, index) => defaultTrainerCard(
                    onTap: () {
                      //navigateTo(context, TrainerProfileScreen());
                    },
                    context: context),
                itemCount: 9,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
