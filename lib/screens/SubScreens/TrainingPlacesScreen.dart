import 'package:coachstationtrainer/Helper/components.dart';
import 'package:flutter/material.dart';

class TrainingPlacesScreen extends StatefulWidget {
  @override
  _TrainingPlacesScreenState createState() => _TrainingPlacesScreenState();
}



Widget showAvilableTimeInIntervalTime(
    {BuildContext context,
    String intervalDays,
    String startTime,
    String endTime}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 13.0),
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
                  text: intervalDays ?? 'الأحد',
                  textColor: Colors.white)),
        ),
        Row(
          children: [
            defaultShowTime(
                context: context, textTime: startTime ?? 'من 30 10 ص'),
            SizedBox(width: 12.0,),defaultShowTime(
                context: context, textTime: endTime ?? 'إلى 50 11 ص'),
          ],
        ),
      ],
    ),
  );
}

Widget showCardAboutReservationPlace(
    {BuildContext context, Size media, bool isShowInOneDay = true}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
    child: Container(
      width: media.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey[300],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          )),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            height: 48,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Golds Gym',
                  style: Theme.of(context).textTheme.headline3,
                ),
                defaultLocationWithIcon(
                    context: context, textLocation: 'الرياض')
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: media.width,
            height: media.height * 0.17,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => isShowInOneDay == true
                  ? showAvilableTimeInOneDay(context: context)
                  : showAvilableTimeInIntervalTime(context: context,
              intervalDays: 'من السبت إلى الأربعاء'),
              itemCount: 3,
            ),
          ),

          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    ),
  );
}

class _TrainingPlacesScreenState extends State<TrainingPlacesScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
          child: Column(
      children: [
          showCardAboutReservationPlace(context: context, media: media),
          showCardAboutReservationPlace(context: context, media: media,isShowInOneDay: false)
      ],
    ),
        ));
  }
}
