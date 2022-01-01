import 'package:coachstationtrainer/Screens/IntroScreens/SplashScreen.dart';
import 'package:coachstationtrainer/Screens/MainScreens/NavigationHome.dart';
import 'package:coachstationtrainer/provider/locale_provider.dart';


//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'Localization/app_localization_delegate.dart';
import 'provider/changeIndexPage.dart';
import 'screens/IntroScreens/LoginScreen.dart';
import 'screens/IntroScreens/RegisterScreen.dart';

const domain = "https://wekala.greencodet.com";
const photosPreUrl = "https://wekala.greencodet.com/storage/";

//Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//  await Firebase.initializeApp();
//
//  print("Handling a background message: ${message.messageId}");
//}
AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.high,
);
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
//  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//  _firebaseMessaging.requestPermission(
//      sound: true, badge: true, alert: true
//  );

//  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//  await flutterLocalNotificationsPlugin
//      .resolvePlatformSpecificImplementation<
//      AndroidFlutterLocalNotificationsPlugin>()
//      ?.createNotificationChannel(channel);

  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.top,
    SystemUiOverlay.bottom,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Color(0xFF142c43), // Color for Android
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  Future onDidReceiveLocalNotification(
//      int id, String title, String body, String payload) async {
//    // display a dialog with the notification details, tap ok to go to another page
//    showDialog(
//      context: context,
//      builder: (BuildContext context) => CupertinoAlertDialog(
//        title: Text(title),
//        content: Text(body),
//        actions: [
//          CupertinoDialogAction(
//            isDefaultAction: true,
//            child: Text('Ok'),
//            onPressed: () async {
//              Navigator.of(context, rootNavigator: true).pop();
//              // await Navigator.push(
//              //   context,
//              //   MaterialPageRoute(
//              //     builder: (context) => SecondScreen(payload),
//              //   ),
//              // );
//            },
//          )
//        ],
//      ),
//    );
//  }
//
//  askForNotificationsPermission()async{
//    final status = await Permission.notification.request();
//    if (status == PermissionStatus.granted) {
//      print('Permission granted');
//    } else if (status == PermissionStatus.denied) {
//      print('Denied. Show a dialog with a reason and again ask for the permission.');
//    } else if (status == PermissionStatus.permanentlyDenied) {
//      print('permanentlyDenied. Show a dialog with a reason and again ask for the permission.');
//
//      // showAlertDialog(context,content: 'يجب الموافقة علي تصريح موقعك الحالي للإستكمال',onOk: ()=>Navigator.pop(context));
//    }
//  }

  @override
  void initState() {
    super.initState();
//    askForNotificationsPermission();
//    var initialzationSettingsAndroid =
//    AndroidInitializationSettings('@mipmap/launcher_icon');
//    final IOSInitializationSettings initializationSettingsIOS =
//    IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//    var initializationSettings =
//    InitializationSettings(android: initialzationSettingsAndroid,iOS:initializationSettingsIOS );
//
//    flutterLocalNotificationsPlugin.initialize(initializationSettings);
//    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//      RemoteNotification notification = message.notification;
//      AndroidNotification android = message.notification?.android;
//      if (notification != null && android != null) {
//        flutterLocalNotificationsPlugin.show(
//            notification.hashCode,
//            notification.title,
//            notification.body,
//            NotificationDetails(
//              android: AndroidNotificationDetails(
//                channel.id,
//                channel.name,
//                // TODO add a proper drawable resource to android, for now using
//                //      one that already exists in example app.
//                icon: '@mipmap/launcher_icon',
//              ),
//            ));
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider()),
        ChangeNotifierProvider.value(
          value: ChangeIndex(),
        ),
//        ChangeNotifierProvider<UserDataProvider>(
//            create: (_) => UserDataProvider()),
//        ChangeNotifierProvider<BrandsProvider>(
//            create: (_) => BrandsProvider()),
//        ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
//        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
//        ChangeNotifierProvider<OffersProvider>(create: (_) => OffersProvider()),
//        ChangeNotifierProvider<AlarmsProvider>(create: (_) => AlarmsProvider()),
//        ChangeNotifierProvider<FixingPlacesProvider>(create: (_) => FixingPlacesProvider()),
//        ChangeNotifierProvider<ProductsProvider>(create: (_) => ProductsProvider()),
//        ChangeNotifierProvider<VendorsProvider>(create: (_) => VendorsProvider()),
//        ChangeNotifierProvider<OrdersProvider>(create: (_) => OrdersProvider()),
//        ChangeNotifierProvider<NotificationsProvider>(create: (_) => NotificationsProvider()),
//        ChangeNotifierProvider<SettingProvider>(create:(_) =>SettingProvider() ),
//        ChangeNotifierProvider<ContactUsProvider>(create:(_) =>ContactUsProvider() ,),
        //ContactUsProvider
      ],
      child: Consumer<LocaleProvider>(builder:
          (BuildContext context, LocaleProvider localeProvider, Widget child) {

        return MaterialApp(
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            locale: localeProvider.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              canvasColor: Colors.transparent,
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              primaryColor: const Color(0xFFf1c40e),
              accentColor: Color(0xFF142c43),
//                textSelectionColor: Colors.grey[600],
//                textSelectionHandleColor: const Color(0xFFf1c40e),
              //  accentColor: const Color(0xFFeccc3c),
              // backgroundColor: const Color(0xFFf8b42c),
              cardColor: const Color(0xFFf8b42c),
              //  iconTheme: const IconThemeData(color: Color(0xFF207cc4)),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: const Color(0xFF207cc4),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedLabelStyle: TextStyle(
                  fontFamily: 'DIN',
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'DIN',
                ),
              ),
              appBarTheme: AppBarTheme(
                elevation: 0.0,
                titleTextStyle: TextStyle(
                    fontFamily: 'CairoBold',
                    color: const Color(0xffffffff),
                    fontSize: 17),//20
                color: Color(0xFF142c43),
                iconTheme: const IconThemeData(
                  color: Color(0xffffffff),
                ),
              ),
              tabBarTheme: TabBarTheme(
                labelStyle: TextStyle(
                    fontFamily: 'CairoBold',
                    fontSize: 14),
                unselectedLabelStyle: TextStyle(
                    fontFamily: 'CairoBold',
                    color: Colors.white,
                    fontSize: 14),
              ),
              dialogTheme: DialogTheme(
                  contentTextStyle: TextStyle(
                    fontFamily: 'DIN',
                    fontSize: 19,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                  titleTextStyle: TextStyle(
                    fontFamily: 'DIN',
                    fontSize: 19,
                    color: const Color(0xFF039666),
                    fontWeight: FontWeight.bold,
                  )),
              textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1: TextStyle(
                  fontFamily: 'CairoRegular',
                  fontSize: 16,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
                bodyText1: TextStyle(
                  fontFamily: 'CairoBold',
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
                button: TextStyle(
                  fontFamily: 'CairoRegular',
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
                bodyText2: TextStyle(
                  fontFamily: 'DIN',
                  color: Colors.grey[800],
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                subtitle2: TextStyle(
                  fontFamily: 'CairoBold',
                  fontSize: 11,
                  height: 1.5,
                  color: Colors.grey[600],
                  // fontWeight: FontWeight.bold,
                ),
                headline1: TextStyle(
                  fontFamily: 'CairoBold',
                  fontSize: 11,
                  height: 1.5,
                  color: Colors.grey[600],
                  // fontWeight: FontWeight.bold,
                ),
                headline2: TextStyle(
                  fontFamily: 'CairoBold',
                  fontSize: 13,
                  color: Colors.grey[800],
                  // fontWeight: FontWeight.bold,
                ),
                headline3: TextStyle(
                  fontFamily: 'CairoBold',
                  fontSize: 15,
                  color: Colors.grey[800],
                ),
                headline4: TextStyle(
                  fontFamily: 'CairoBold',
                  fontSize: 17,
                  color: Colors.grey[800],
                ),
                headline5: TextStyle(
                  fontFamily: 'CairoBold',
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
            ),
            title: 'Coach Station',
            home: SplashScreen(),
//
//          ShowPresentScreen(),
            //SplashScreen(),
            //LoginScreen(),
            //RegisterScreen(),





            //Splash(),
            // home: OrderDetailes(),
            routes: {
//              Splash.routName: (context) => Splash(),
//              NavigationHome.routName: (context) => NavigationHome(),
//              Login.routName: (context) => Login(),
//              ForgetPassword.routName: (context) => ForgetPassword(),
//              Register.routName: (context) => Register(),
//              Home.routName: (context) => Home(),
//              CartScreen.routName: (context) => CartScreen(),
//              CarsModels.routName: (context) => CarsModels(),
//              FixingPlaces.routName: (context) => FixingPlaces(),
//              ProductDetails.routName: (context) => ProductDetails(),
//              MyOrders.routName: (context) => MyOrders(),
//              PaymentScreens.routName: (context) => PaymentScreens(),
//              TermsParent.routName: (context) => TermsParent(),
//              SearchScreen.routName:(context)=>SearchScreen(),
//              ContactUs.routName: (context) => ContactUs(),
//              UserProfile.routName: (context) => UserProfile(),
//              OrderTracking.routName: (context) => OrderTracking(),
//              PreviousOrders.routName: (context) => PreviousOrders(),
//              FavouritesScreen.routName: (context) => FavouritesScreen(),
//              NotificationsScreen.routName: (context) => NotificationsScreen(),
//              AlarmsScreen.routName: (context) => AlarmsScreen(),
//              MoreScreen.routName: (context) => MoreScreen(),
//              CatalogueScreen.routName: (context) => CatalogueScreen(),
//              Stores.routName: (context) => Stores(),
//              StoreDetails.routName: (context) => StoreDetails(),
//              AlarmDetails.routName:(context)=>AlarmDetails(),
//              AddAlarm.routName:(context)=>AddAlarm(),
//              ChangePassword.routName:(context)=>ChangePassword(),
//              OrderDetails.routName:(context)=>OrderDetails(),
//              Verification.routName:(context)=>Verification(),
//              CarDetails.routName:(context)=>CarDetails(),
            });
      }),
    );
  }
}
