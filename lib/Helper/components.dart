import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:coachstationtrainer/screens/SubScreens/GoogleMapScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

const defaultColor = const Color(0xFFf1c40e);
final List<String> imgList = [
  'https://thumbs.dreamstime.com/t/gym-24699087.jpg',
  'https://media.istockphoto.com/photos/empty-gym-picture-id1132006407?k=20&m=1132006407&s=612x612&w=0&h=Z7nJu8jntywb9jOhvjlCS7lijbU4_hwHcxoVkxv77sg=',
  'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX26664924.jpg',
  'https://media.istockphoto.com/photos/muscular-trainer-writing-on-clipboard-picture-id675179390?k=20&m=675179390&s=612x612&w=0&h=7LP7-OamGu-b8XG-VKcJuamK5s80ke-4oJ5siUrjFVA=',
  'https://www.muscleandfitness.com/wp-content/uploads/2019/11/Young-Muscular-Man-Doing-Lunges-In-Dark-Gym.jpg?w=1109&h=614&crop=1&quality=86&strip=all',
  'https://www.giggsmeat.com/wp-content/uploads/2020/10/4wqKj5zM2a-min.jpg'
];

Widget defaultButton({
  double width = double.infinity,
  Color background = defaultColor,
  bool isUpperCase = true,
  double radius = 25.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: 48.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontFamily: 'Cairobold',
            color: Colors.grey[800],
            fontSize: 16,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultShowTime({BuildContext context, String textTime}) {
  return Row(
    children: [
      Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red[500],
            ),
            color: Colors.red,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          width: 11,
          height: 11,
          child: SizedBox()),
      SizedBox(
        width: 5.0,
      ),
      defaultSubtitleTextTwo(context: context, text: textTime),
    ],
  );
}

Widget defaultCard({
  @required Function function,
  @required BuildContext context,
  @required String textTitle,
  String textSubTitleOne,
  String textSubTitleTwo,
  @required String imageUrl,
  @required double cardWidth,
  @required double containerTextWidth,
  @required double cardHeight,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: function,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                height: cardHeight ?? 100,
                width: cardWidth ?? 120,
              ),
            ),
            Container(
              height: textSubTitleOne != null ? 52 : 33,
              width: containerTextWidth,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(28.0))),
              child: textSubTitleOne != null
                  ? Column(
                      children: [
                        Text(textTitle,
                            style: Theme.of(context).textTheme.headline2),
                        textSubTitleTwo != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(textSubTitleOne,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .copyWith(color: Colors.grey[800])),
                                  Text(' - ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                  Text(textSubTitleTwo,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .copyWith(color: Colors.grey[800])),
                                ],
                              )
                            : Text(textSubTitleOne,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                        height: 1.1, color: Colors.grey[800])),
                      ],
                    )
                  : Center(
                      child: Text(textTitle,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
            ),
          ],
        ),
      ),
    );

Widget defaultLocationWithIcon(
    {@required BuildContext context, String textLocation}) {
  return InkWell(
    onTap: () {
      navigateTo(context, GoogleMapScreen());
    },
    child: Row(
      children: [
        ImageIcon(
          AssetImage('images/locationMark.png'),
          size: 15,
          color: Colors.red,
        ),
        SizedBox(
          width: 5.0,
        ),
        defaultSubtitleTextTwo(context: context, text: textLocation),
      ],
    ),
  );
}

Widget subtitleOfHomeScreen(
    {Function function,
    BuildContext context,
    String textKey,
    bool isHomeScreen = false,
    bool isEnableSpaceBeforeArrow = false}) {
  return InkWell(
    onTap: function,
    child: Row(
      children: [
        Text(
          '${AppLocalizations.of(context).trans(textKey)}',
          style: Theme.of(context).textTheme.headline4,
        ),
        isEnableSpaceBeforeArrow == true ? Spacer() : SizedBox(),
        Icon(
          Icons.arrow_forward_ios,
          size: 18.0,
          color: isHomeScreen == true ? Colors.grey[800] : Colors.grey[300],
        ),
        isEnableSpaceBeforeArrow == false ? Spacer() : SizedBox()
      ],
    ),
  );
}

Widget defaultArticle({
  @required Function function,
  @required BuildContext context,
  @required String textTitle,
  @required String textSubTitle,
  @required String imageUrl,
  @required double imageHeight,
  @required double articleWidth,
  @required double articleHeight,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: function,
        child: SizedBox(
          height: articleHeight,
          width: articleWidth,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                    height: imageHeight,
                    width: articleWidth,
                  ),
                ),
              ),
              Container(
                width: articleWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[200]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    )),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                  title: Text(textTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline2),
                  subtitle: Text(textSubTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle2),
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget defaultTextButton({
  @required Function function,
  @required BuildContext context,
  @required String textKey,
}) =>
    TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: function,
      child: Text('${AppLocalizations.of(context).trans(textKey)}',
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: defaultColor)),
    );

Widget defaultSubtitleTextOne(
        {@required BuildContext context, @required String text, Color color}) =>
    Text(text,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: color ?? Colors.grey[800]));

Widget showTextWithIcon(
    {@required BuildContext context,
    String iconUrl,
    String titleText,
    Color colorOfWidget = Colors.red}) {
  return Row(
    children: [
      ImageIcon(
        AssetImage(iconUrl),
        size: 15,
        color: colorOfWidget,
      ),
      SizedBox(
        width: 5.0,
      ),
      defaultSubtitleTextTwo(
          context: context,
          text: titleText,
          textColor: colorOfWidget != Colors.red ? colorOfWidget : null),
    ],
  );
}

Widget showAvilableTimeInOneDay(
    {BuildContext context, String dayName, String startTime, String endTime}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
    child: Column(
      children: [
        Container(
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Center(
              child: defaultSubtitleTextTwo(
                  context: context,
                  text: dayName ?? 'الأحد',
                  textColor: Colors.white)),
        ),
        SizedBox(
          height: 8.0,
        ),
        defaultShowTime(context: context, textTime: startTime ?? 'من 30 10 ص'),
        defaultShowTime(context: context, textTime: endTime ?? 'إلى 50 11 ص'),
      ],
    ),
  );
}

Widget defaultSubtitleTextTwo(
        {@required BuildContext context,
        @required String text,
        Color textColor}) =>
    Text(text,
        style: Theme.of(context).textTheme.headline1.copyWith(
              height: 1.5,
              color: textColor ?? Colors.grey[700],
            ));

Widget defaultTrainerCard({BuildContext context, Function onTap}) {
  return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 11.0, left: 0.0, right: 0.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11.0)),
              border: Border.all(color: Colors.grey[300])),
          child: Row(
            children: [
              Stack(
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
                  Positioned(
                    child: CircleAvatar(
                      radius: 15,
                      child: ClipOval(
                        child: Image.asset(
                          "images/allah.png",
                          fit: BoxFit.cover,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    left: 5.0,
                    bottom: 0.0,
                  )
                ],
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
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    defaultSubtitleTextTwo(
                        context: context, text: 'اللياقة والعلاج الطبيعى'),
                    const SizedBox(
                      height: 4.0,
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
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => ImageIcon(
                            AssetImage('images/star.png'),
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Spacer(),
                        defaultLocationWithIcon(
                            context: context, textLocation: 'الرياض')
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
}

Widget bottomNavigationBar(
    {@required BuildContext context,
    @required Size media,
    @required int currentIndex,
    @required Function onTap}) {
  return Container(
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
              title: Text(AppLocalizations.of(context).trans("home"),
                  style: TextStyle(
                      fontSize: media.width * 0.028, fontFamily: 'Net'))),
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
              title: Text(AppLocalizations.of(context).trans("program"),
                  style: TextStyle(
                      fontSize: media.width * 0.028, fontFamily: 'Net'))),
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
              title: Text(AppLocalizations.of(context).trans("trainer"),
                  style: TextStyle(
                      fontSize: media.width * 0.028, fontFamily: 'Net'))),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: ImageIcon(
                  AssetImage('images/heart.png'),
                  size: media.width * 0.06,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: ImageIcon(
                  AssetImage('images/heart.png'),
                  size: media.width * 0.06,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              title: Text(AppLocalizations.of(context).trans("favourite"),
                  style: TextStyle(
                      fontSize: media.width * 0.028, fontFamily: 'Net'))),
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
              title: Text(AppLocalizations.of(context).trans("more"),
                  style: TextStyle(
                      fontSize: media.width * 0.028, fontFamily: 'Net'))),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(size: 25),
        unselectedIconTheme: IconThemeData(color: Colors.black45, size: 25),
        // selectedItemColor: Theme.of(context).primaryColor,
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 12, fontFamily: 'Net'),
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 12, fontFamily: 'Net'),
      ),
    ),
  );
}
//bottomNavigationBar: Consumer<ChangeIndex>(
//builder: (context, changeIndex, child) =>bottomNavigationBar(
//context: context,
//onTap: (index){
//setState(() {
//changeIndex.index=index;
//});
//Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
//pageBuilder:
//(context, animation1, animation2) =>
//NavigationHome(),
//transitionDuration: Duration(seconds: 0),
//),(Route<dynamic> route) => false);
//},
//media: media,
//currentIndex: changeIndex.index
//),
//),

Widget defaultFormField({
  TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  String label,
  IconData prefix,
  IconData suffix,
  Color suffixColor,
  Function suffixPressed,
  bool isClickable = true,
  bool readOnly = false,
}) =>
    SizedBox(
      height: 55.0,
      child: InkWell(
        onTap: isClickable == false ? onTap : null,
        child: TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          enabled: isClickable,
          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          onTap: onTap ?? () {},
          validator: validate,
          cursorColor: defaultColor,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: prefix != null
                ? Icon(
                    prefix,
                  )
                : null,
            labelStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: Icon(
                      suffix,
                      color: suffixColor,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedErrorBorder: textFormFieldBorder,
            focusedBorder: textFormFieldBorder,
            disabledBorder: textFormFieldBorder,
            errorBorder: textFormFieldBorder,
            errorStyle: TextStyle(color: defaultColor),
            contentPadding: EdgeInsets.only(bottom: 10, right: 15, left: 15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey[300])),
            suffixIconColor: defaultColor,
          ),
          readOnly: readOnly,
        ),
      ),
    );
OutlineInputBorder textFormFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: defaultColor));

Widget defaultAppBar(
        {@required BuildContext context,
        String titleKey,
        bool enableLeading = true,
        bool isTextNotKey = false,
        bool automaticallyImplyLeading = true,
        List<Widget> actions,
        Function onClickedBackButton}) =>
    AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: enableLeading == true
          ? IconButton(
              onPressed: onClickedBackButton == null
                  ? () {
                      Navigator.pop(context);
                    }
                  : onClickedBackButton,
              icon: const ImageIcon(
                AssetImage(
                  'images/arrowLeft.png',
                ),
                size: 16,
              ))
          : null,
      centerTitle: !enableLeading,
      title: Text(
        isTextNotKey
            ? titleKey
            : '${AppLocalizations.of(context).trans(titleKey)}',
      ),
      titleSpacing: 2.0,
      actions: actions,
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 30.0, end: 30.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, Widget widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

void showToast({
  @required String text,
  @required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

//
//Widget buildTaskItem(Map model, context) => Dismissible(
//      key: Key(model['id'].toString()),
//      child: Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: Row(
//          children: [
//            CircleAvatar(
//              radius: 40.0,
//              child: Text(
//                '${model['time']}',
//              ),
//            ),
//            SizedBox(
//              width: 20.0,
//            ),
//            Expanded(
//              child: Column(
//                mainAxisSize: MainAxisSize.min,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                  Text(
//                    '${model['title']}',
//                    style: TextStyle(
//                      fontSize: 18.0,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                  Text(
//                    '${model['date']}',
//                    style: TextStyle(
//                      color: Colors.grey,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            SizedBox(
//              width: 20.0,
//            ),
//            IconButton(
//              onPressed: () {
//                AppCubit.get(context).updateData(
//                  status: 'done',
//                  id: model['id'],
//                );
//              },
//              icon: Icon(
//                Icons.check_box,
//                color: Colors.green,
//              ),
//            ),
//            IconButton(
//              onPressed: () {
//                AppCubit.get(context).updateData(
//                  status: 'archive',
//                  id: model['id'],
//                );
//              },
//              icon: Icon(
//                Icons.archive,
//                color: Colors.black45,
//              ),
//            ),
//          ],
//        ),
//      ),
//      onDismissed: (direction) {
//        AppCubit.get(context).deleteData(
//          id: model['id'],
//        );
//      },
//    )
//
//Widget tasksBuilder({
//  @required List<Map> tasks,
//}) =>
//    ConditionalBuilder(
//      condition: tasks.length > 0,
//      builder: (context) => ListView.separated(
//        itemBuilder: (context, index) {
//          return buildTaskItem(tasks[index], context);
//        },
//        separatorBuilder: (context, index) => myDivider(),
//        itemCount: tasks.length,
//      ),
//      fallback: (context) => Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Icon(
//              Icons.menu,
//              size: 100.0,
//              color: Colors.grey,
//            ),
//            Text(
//              'No Tasks Yet, Please Add Some Tasks',
//              style: TextStyle(
//                fontSize: 16.0,
//                fontWeight: FontWeight.bold,
//                color: Colors.grey,
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//Widget buildArticleItem(article, context) => InkWell(
//      onTap: () {
//        navigateTo(
//          context,
//          WebViewScreen(article['url']),
//        );
//      },
//      child: Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: Row(
//          children: [
//            Container(
//              width: 120.0,
//              height: 120.0,
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(
//                  10.0,
//                ),
//                image: DecorationImage(
//                  image: NetworkImage('${article['urlToImage']}'),
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),
//            SizedBox(
//              width: 20.0,
//            ),
//            Expanded(
//              child: Container(
//                height: 120.0,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: [
//                    Expanded(
//                      child: Text(
//                        '${article['title']}',
//                        style: Theme.of(context).textTheme.bodyText1,
//                        maxLines: 3,
//                        overflow: TextOverflow.ellipsis,
//                      ),
//                    ),
//                    Text(
//                      '${article['publishedAt']}',
//                      style: TextStyle(
//                        color: Colors.grey,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//            SizedBox(
//              width: 15.0,
//            ),
//          ],
//        ),
//      ),
//    );
//
//Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
//      condition: list.length > 0,
//      builder: (context) => ListView.separated(
//        physics: BouncingScrollPhysics(),
//        itemBuilder: (context, index) => buildArticleItem(list[index], context),
//        separatorBuilder: (context, index) => myDivider(),
//        itemCount: 10,
//      ),
//      fallback: (context) =>
//          isSearch ? Container() : Center(child: CircularProgressIndicator()),
//    );

//Widget buildListProduct(
//  model,
//  context, {
//  bool isOldPrice = true,
//}) =>
//    Padding(
//      padding: const EdgeInsets.all(20.0),
//      child: Container(
//        height: 120.0,
//        child: Row(
//          children: [
//            Stack(
//              alignment: AlignmentDirectional.bottomStart,
//              children: [
//                Image(
//                  image: NetworkImage(model.image),
//                  width: 120.0,
//                  height: 120.0,
//                ),
//                if (model.discount != 0 && isOldPrice)
//                  Container(
//                    color: Colors.red,
//                    padding: EdgeInsets.symmetric(
//                      horizontal: 5.0,
//                    ),
//                    child: Text(
//                      'DISCOUNT',
//                      style: TextStyle(
//                        fontSize: 8.0,
//                        color: Colors.white,
//                      ),
//                    ),
//                  ),
//              ],
//            ),
//            SizedBox(
//              width: 20.0,
//            ),
//            Expanded(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                  Text(
//                    model.name,
//                    maxLines: 2,
//                    overflow: TextOverflow.ellipsis,
//                    style: TextStyle(
//                      fontSize: 14.0,
//                      height: 1.3,
//                    ),
//                  ),
//                  Spacer(),
//                  Row(
//                    children: [
//                      Text(
//                        model.price.toString(),
//                        style: TextStyle(
//                          fontSize: 12.0,
//                          color: defaultColor,
//                        ),
//                      ),
//                      SizedBox(
//                        width: 5.0,
//                      ),
//                      if (model.discount != 0 && isOldPrice)
//                        Text(
//                          model.oldPrice.toString(),
//                          style: TextStyle(
//                            fontSize: 10.0,
//                            color: Colors.grey,
//                            decoration: TextDecoration.lineThrough,
//                          ),
//                        ),
//                      Spacer(),
//                      IconButton(
//                        onPressed: () {
//                          ShopCubit.get(context).changeFavorites(model.id);
//                        },
//                        icon: CircleAvatar(
//                          radius: 15.0,
//                          backgroundColor:
//                              ShopCubit.get(context).favorites[model.id]
//                                  ? defaultColor
//                                  : Colors.grey,
//                          child: Icon(
//                            Icons.favorite_border,
//                            size: 14.0,
//                            color: Colors.white,
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
