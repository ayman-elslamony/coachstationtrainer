import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChooseTheTrainingPlaceScreen extends StatefulWidget {
  @override
  _ChooseTheTrainingPlaceScreenState createState() => _ChooseTheTrainingPlaceScreenState();
}

class _ChooseTheTrainingPlaceScreenState extends State<ChooseTheTrainingPlaceScreen> {
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
      child:  Scaffold(
        appBar: defaultAppBar(
            context: context, titleKey: 'training_place',
            onClickedBackButton: (){
              Navigator.of(context).pop(true);
            },
            ),
        body: SizedBox(
          height: media.height,
          width: media.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                  child: defaultFormField(
                      onTap: (){
                        print('/dfbcb');
                      },

                      type: TextInputType.number,
                      validate: (String value) {
                        return null;
                      },
                      onChange: (String val) {
                        setState(() {});
                      },
                      isClickable: true,
                      prefix:Icons.search
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.all(12.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Stack(
                    children: [
                      defaultCard(
                          function: () {
                              Navigator.of(context).pop(true);
                          },
                          context: context,
                          textTitle:
                          '${AppLocalizations.of(context).trans('gyms')}',
                          imageUrl: imgList[index],
                          cardWidth: media.width,
                          containerTextWidth: media.width * 0.7,
                          cardHeight: 150),
                    ],
                  ),
                  itemCount: imgList.length,
                  scrollDirection: Axis.vertical,
                ),
              ],
            ),
          ),
        ),
      ),);
  }
}
