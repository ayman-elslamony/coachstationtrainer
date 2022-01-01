import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';






class ProgramScreen extends StatefulWidget {
  @override
  _ProgramScreenState createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
            elevation: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).accentColor,
            // expandedHeight: 60,
            centerTitle: true,
            title: Text('${AppLocalizations.of(context).trans('program')}'),
            actions: []
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(11.0)),
                          border: Border.all(color: Colors.grey[300])),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                                child: Image.network(
                                  imgList[index],
                                  fit: BoxFit.fill,
                                  height:  media.height*0.15,
                                  width:  media.width*0.34,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20.0,),
                          Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Text(
                                'برنامج غذائى 1',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              SizedBox(height: 8.0,),
                              showTextWithIcon(
                                  context: context,
                                  iconUrl: 'images/calendar.png',
                                  titleText: 'من 20 فبراير 2022'),

                              showTextWithIcon(
                                  context: context,
                                  iconUrl: 'images/calendar.png',
                                  titleText: 'إلى 29 فبراير 2022'),

                            ],),
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: imgList.length,
              ),
            ),
          ),
        )
      ],
    );
  }
}
