// ignore_for_file: file_names, unnecessary_this, unnecessary_string_interpolations, use_rethrow_when_possible, non_constant_identifier_names, unnecessary_brace_in_string_interps, prefer_final_fields, prefer_const_constructors, use_key_in_widget_constructors

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:coachstationtrainer/provider/HomeProvider.dart';
import 'package:coachstationtrainer/provider/changeIndexPage.dart';
import 'package:coachstationtrainer/provider/locale_provider.dart';

import 'FavouriteScreen.dart';
import 'HomeScreen.dart';
import 'MoreScreen.dart';
import 'ProgramScreen.dart';
import 'TrainersScreen.dart';


//import 'package:coachstationtrainer/screens/MainScreens/Cart.dart';
//import 'package:coachstationtrainer/screens/MainScreens/Home.dart';
//import 'package:coachstationtrainer/provider/CartProvider.dart';
//import 'package:coachstationtrainer/screens/MainScreens/Alarms.dart';
//import 'package:coachstationtrainer/screens/MainScreens/MoreScreen.dart';
//import 'package:coachstationtrainer/screens/MainScreens/Stores.dart';

class NavigationHome extends StatefulWidget {
  static const String routName = '/NavigationHome_Screen';

  @override
  _NavigationHomeState createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  List<Widget> mainWidgets = [

    HomeScreen(),
    ProgramScreen(),
    TrainersScreen(),
    MoreScreen(),
  ];
  var _locale;
  Map passedData = {};
  var _isInit = true;
  var products;


//  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//  @override
//  void didChangeDependencies() {
//
//    super.didChangeDependencies();
//    if (_isInit) {
//      passedData = ModalRoute.of(context).settings.arguments;
//
//      mainWidgets = [
//        Home(),
//        Stores(
//          status: passedData != null ? passedData['status'] : '',
//        ),
//        CartScreen(),
//        AlarmsScreen(),
//        MoreScreen(),
//      ];
//      // _firebaseMessaging.getToken().then((fcmToken) => print('FCM Token : $fcmToken'));
//      _isInit = false;
//    }
//  }

  var homeData;
//  @override
//  void initState() {
//    super.initState();
//    _locale =
//        Provider.of<LocaleProvider>(context, listen: false).locale.languageCode;
//
//    Provider.of<HomeProvider>(context, listen: false)
//        .getHomeData(context: context, locale: _locale)
//        .then((value) {
//      homeData = Provider.of<HomeProvider>(context, listen: false).homeData;
//      Provider.of<CartProvider>(context, listen: false)
//          .getCartData(context, _locale)
//          .then((value) {
//        products = Provider.of<CartProvider>(context, listen: false)
//            .cart
//            .products
//            .length;
//      });
//    });
//  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
   // var stage = Provider.of<HomeProvider>(context).homeStage;

//    final cartProducts = Provider.of<CartProvider>(context).cart;
    return Consumer<ChangeIndex>(
        builder: (context, changeIndex, child) => WillPopScope(
              onWillPop: () async {
                SystemNavigator.pop();
                return false;
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                body: mainWidgets[changeIndex.index],
                extendBody: true,
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(0),
                    ),
                    child: BottomNavigationBar(
                      elevation: 0.0,
                      items: [
                        BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: ImageIcon(
                                AssetImage('images/homeBottomGrey.png'),
                                size: media.width * 0.06,
                              ),
                            ),
                            activeIcon: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: ImageIcon(
                                AssetImage('images/homeBottomSilver.png'),
                                size: media.width * 0.06,
                              ),
                            ),
                            title: Text(
                                AppLocalizations.of(context).trans("home"),
                                style: TextStyle(
                                    fontSize: media.width * 0.028,
                                    fontFamily: 'Net'))),
                        BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: ImageIcon(
                                AssetImage('images/fileGrey.png'),
                                size: media.width * 0.06,
                              ),
                            ),
                            activeIcon: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: ImageIcon(
                                AssetImage('images/fileSilver.png'),
                                size: media.width * 0.06,
                              ),
                            ),
                            title: Text(
                                AppLocalizations.of(context).trans("indebtedness"),
                                style: TextStyle(
                                    fontSize: media.width * 0.028,
                                    fontFamily: 'Net'))),
                        BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: ImageIcon(
                                AssetImage('images/greyCoaches.png'),
                                size: media.width * 0.06,
                              ),
                            ),
                            activeIcon: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: ImageIcon(
                                AssetImage('images/coloredCoaches.png'),
                                size: media.width * 0.06,
                              ),
                            ),
                            title: Text(
                                AppLocalizations.of(context).trans("my_page"),
                                style: TextStyle(
                                    fontSize: media.width * 0.028,
                                    fontFamily: 'Net'))),
                        BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: ImageIcon(
                                AssetImage('images/menuBottom.png'),
                                size: media.width * 0.06,
                              ),
                            ),
                            activeIcon: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: ImageIcon(
                                AssetImage('images/menuBar.png'),
                                size: media.width * 0.06,
                              ),
                            ),
                            title: Text(
                                AppLocalizations.of(context).trans("more"),
                                style: TextStyle(
                                    fontSize: media.width * 0.028,
                                    fontFamily: 'Net'))),
                      ],
                      unselectedItemColor: Colors.grey,
                      selectedItemColor: Theme.of(context).primaryColor,
                      showUnselectedLabels: true,
                      currentIndex: changeIndex.index,
                      onTap: changeIndex.changeIndexFunction,
                      type: BottomNavigationBarType.fixed,
                      selectedIconTheme: IconThemeData(size: 25),
                      unselectedIconTheme:
                          IconThemeData(color: Colors.black45, size: 25),
                      // selectedItemColor: Theme.of(context).primaryColor,
                      selectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          fontFamily: 'Net'),
                      unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          fontFamily: 'Net'),
                    ),
                  ),
                ),
              ),
            ));
  }
}
