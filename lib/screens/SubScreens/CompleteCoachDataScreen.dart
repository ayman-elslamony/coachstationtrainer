import 'dart:io';

import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'ChooseTheTrainingPlaceScreen.dart';
import 'ShowSpecificGymScreen.dart';

class CompleteCoachDataScreenStepOne extends StatefulWidget {
  @override
  _CompleteCoachDataScreenStepOneState createState() =>
      _CompleteCoachDataScreenStepOneState();
}

class _CompleteCoachDataScreenStepOneState extends State<CompleteCoachDataScreenStepOne> {
  final ImagePicker _picker = ImagePicker();
  List<File> _certificatesImgListFile = [];
  List<File> _profileImgListFile = [];

  List<String> _nationalList = ['egypt', 'american'];
  final _formKey = GlobalKey<FormState>();
  bool _birthDateValidator = false;
  bool _nationalValidator = false;
  bool regionValidator = false;
  var birthDateController = TextEditingController();
  var nationalController = TextEditingController();
  var regionController = TextEditingController();

  Future<void> _getImage(
      {ImageSource source,
      BuildContext context,
      bool isCertificatesList = false}) async {
    await _picker
        .pickImage(source: source, maxWidth: 400.0)
        .then((XFile image) {
      if (image != null) {
        File x = File(image.path);
        setState(() {
          if (isCertificatesList == true) {
            _certificatesImgListFile.add(x);
          } else {
            _profileImgListFile.add(x);
          }
        });
        Navigator.pop(context);
      }
    });
  }

  void _openImagePicker(
      {BuildContext context, bool isCertificatesList = false}) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.16
                : MediaQuery.of(context).size.height * 0.28,
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Text(
                  AppLocalizations.of(context).locale.languageCode == "en"
                      ? 'Pick an Image'
                      : 'التقط صوره',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: defaultColor)),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton.icon(
                    icon: ImageIcon(AssetImage('images/camera.png'),
                        color: Colors.white),
                    style: TextButton.styleFrom(
                      backgroundColor: defaultColor,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    label: Text(
                        AppLocalizations.of(context).locale.languageCode == "en"
                            ? 'Use Camera'
                            : 'استخدم الكاميرا',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.white)),
                    onPressed: () {
                      _getImage(
                          context: context,
                          isCertificatesList: isCertificatesList,
                          source: ImageSource.camera);
                      // Navigator.of(context).pop();
                    },
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: defaultColor,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    icon: Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                    label: Text(
                        AppLocalizations.of(context).locale.languageCode == "en"
                            ? 'Use Gallery'
                            : 'استخدم المعرض',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.white)),
                    onPressed: () {
                      _getImage(
                          context: context,
                          isCertificatesList: isCertificatesList,
                          source: ImageSource.gallery);
                    },
                  ),
                ],
              )
            ]),
          );
        });
  }

  Widget addPhotoWidget(
          {BuildContext context,
          Size media,
          bool isCertificatesList = false}) =>
      DottedBorder(
        radius: Radius.circular(
          15,
        ),
        dashPattern: [
          6,
        ],
        borderType: BorderType.RRect,
        padding: EdgeInsets.all(1.0),
        color: Colors.grey[400],
        child: Container(
          width: double.infinity,
          child: MaterialButton(
              onPressed: () {
                _openImagePicker(
                    context: context, isCertificatesList: isCertificatesList);
              },
              child: Center(
                child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[400], width: 3)
                        //color: Colors.grey[300],
                        ),
                    child: Icon(Icons.add, color: Colors.grey[500])),
              )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
            color: Colors.grey[100],
          ),
        ),
      );

  Widget createImageCard(
          {Size media, int index, bool isCertificatesList = false}) =>
      Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15.0,
              ),
              color: Colors.grey[300],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.file(
                  isCertificatesList == true
                      ? _certificatesImgListFile[index]
                      : _profileImgListFile[index],
//                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (isCertificatesList == true) {
                  _certificatesImgListFile.removeAt(index);
                } else {
                  _profileImgListFile.removeAt(index);
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'images/deleteIcon.png',
                  fit: BoxFit.fill,
                  width: 15,
                  height: 15,
                ),
              ),
            ),
          ),
        ],
      );

  Widget communicationWebSitesWidget({String urlImg = 'images/insta.png'}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: CircleAvatar(
            radius: 20,
            child: ClipOval(
              child: Image.asset(
                urlImg,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (val) {},
            cursorColor: defaultColor,
            decoration: InputDecoration(
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
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(context: context, titleKey: 'completing_data2'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        )),
                    child: Center(
                        child: Text(
                      '1',
                      style: Theme.of(context).textTheme.headline3,
                    )),
                  ),
                  title: Text(
                    '${AppLocalizations.of(context).trans('about_the_coach')}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  subtitle: Text(
                    '${AppLocalizations.of(context).trans('step1_of_2')}',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${AppLocalizations.of(context).trans('add_profile_pictures')}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 8.0,
                ),
                _profileImgListFile.length == 0
                    ? DottedBorder(
                        radius: Radius.circular(
                          15,
                        ),
                        dashPattern: [
                          6,
                        ],
                        borderType: BorderType.RRect,
                        padding: EdgeInsets.all(0.0),
                        color: Colors.grey[400],
                        child: Container(
                          width: media.width * 0.81,
                          height: media.height * 0.18,
                          child: MaterialButton(
                              onPressed: () {
                                _openImagePicker(
                                    context: context,
                                    isCertificatesList: false);
                              },
                              child: Center(
                                child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.grey[400], width: 3)
                                        //color: Colors.grey[300],
                                        ),
                                    child: Icon(Icons.add,
                                        color: Colors.grey[500])),
                              )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                            color: Colors.grey[100],
                          ),
                        ),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 0.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _profileImgListFile.length + 1,
                        itemBuilder: (context, index) {
                          int lastIndex = index + 1;
                          if (lastIndex == (_profileImgListFile.length + 1)) {
                            return addPhotoWidget(
                                isCertificatesList: false,
                                context: context,
                                media: media);
                          }
                          return createImageCard(
                              media: media,
                              isCertificatesList: false,
                              index: index);
                        }),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  '${AppLocalizations.of(context).trans('add_other_certificates')}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 8.0,
                ),
                _certificatesImgListFile.length == 0
                    ? DottedBorder(
                        radius: Radius.circular(
                          15,
                        ),
                        dashPattern: [
                          6,
                        ],
                        borderType: BorderType.RRect,
                        padding: EdgeInsets.all(0.0),
                        color: Colors.grey[400],
                        child: Container(
                          width: media.width * 0.81,
                          height: media.height * 0.18,
                          child: MaterialButton(
                              onPressed: () {
                                _openImagePicker(
                                    context: context, isCertificatesList: true);
                              },
                              child: Center(
                                child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.grey[400], width: 3)
                                        //color: Colors.grey[300],
                                        ),
                                    child: Icon(Icons.add,
                                        color: Colors.grey[500])),
                              )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                            color: Colors.grey[100],
                          ),
                        ),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 0.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _certificatesImgListFile.length + 1,
                        itemBuilder: (context, index) {
                          int lastIndex = index + 1;
                          if (lastIndex ==
                              (_certificatesImgListFile.length + 1)) {
                            return addPhotoWidget(
                                isCertificatesList: true,
                                context: context,
                                media: media);
                          }
                          return createImageCard(
                              media: media,
                              isCertificatesList: true,
                              index: index);
                        }),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  '${AppLocalizations.of(context).trans('date_of_birth')}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                defaultFormField(
                  controller: birthDateController,
                  isClickable: true,
                  readOnly: true,
                  suffix: Icons.calendar_today,
                  type: TextInputType.datetime,
                  validate: (val) {
                    if (val == null || val.isEmpty) {
                      setState(() {
                        _birthDateValidator = true;
                      });
                    } else {
                      setState(() {
                        _birthDateValidator = false;
                      });
                    }
                    return null;
                  },
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        onCancel: () {
                          setState(() {
                            birthDateController.text = null;
                          });
                        },
                        showTitleActions: true,
                        theme: DatePickerTheme(
                          itemStyle: TextStyle(color: defaultColor),
                          backgroundColor: Colors.white,
                          doneStyle: TextStyle(color: defaultColor),
                          cancelStyle: TextStyle(color: Colors.red),
                        ),
                        maxTime: DateTime(2080, 6, 7),
                        onChanged: (_) {},
                        onConfirm: (date) {
                          print('confirm $date');
                          setState(() {
                            birthDateController.text =
                                '${date.year}-${date.month}-${date.day}';
                          });
                        },
                        currentTime: DateTime.now(),
                        locale:
                            AppLocalizations.of(context).locale.languageCode ==
                                    "en"
                                ? LocaleType.en
                                : LocaleType.ar);
                    setState(() {
                      _birthDateValidator = false;
                    });
                  },
                ),
                _birthDateValidator
                    ? Align(
                        alignment:
                            AppLocalizations.of(context).locale.languageCode ==
                                    "en"
                                ? Alignment.centerRight
                                : Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            AppLocalizations.of(context).locale.languageCode ==
                                    "en"
                                ? 'Please Enter Birth Date'
                                : 'من فضلك ادخل تاريخ الميلاد',
                            style: TextStyle(color: Colors.red, fontSize: 11),
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${AppLocalizations.of(context).trans('national')}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                defaultFormField(
                  controller: nationalController,
                  type: TextInputType.text,
                  isClickable: true,
                  readOnly: true,
                  suffix: Icons.keyboard_arrow_down,
                  validate: (val) {
                    if (val == null || val.isEmpty) {
                      setState(() {
                        _nationalValidator = true;
                      });
                    } else {
                      setState(() {
                        _nationalValidator = false;
                      });
                    }
                    return null;
                  },
                  onTap: () {
                    setState(() {
                      _nationalValidator = false;
                    });
                  },
                ),
                _nationalValidator
                    ? Align(
                        alignment:
                            AppLocalizations.of(context).locale.languageCode ==
                                    "en"
                                ? Alignment.centerRight
                                : Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            AppLocalizations.of(context).locale.languageCode ==
                                    "en"
                                ? 'please Enter National'
                                : 'من فضلك ادخل الجنسية',
                            style: TextStyle(color: Colors.red, fontSize: 11),
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${AppLocalizations.of(context).trans('regions')}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                defaultFormField(
                  isClickable: true,
                  readOnly: true,
                  controller: regionController,
                  type: TextInputType.text,
                  suffix: Icons.keyboard_arrow_down,
                  validate: (val) {
                    if (val == null || val.isEmpty) {
                      setState(() {
                        regionValidator = true;
                      });
                    } else {
                      setState(() {
                        regionValidator = false;
                      });
                    }
                    return null;
                  },
                  onTap: () {
                    setState(() {
                      regionValidator = false;
                    });
                  },
                ),
                regionValidator
                    ? Align(
                        alignment:
                            AppLocalizations.of(context).locale.languageCode ==
                                    "en"
                                ? Alignment.centerRight
                                : Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            AppLocalizations.of(context).locale.languageCode ==
                                    "en"
                                ? 'Please Enter Region'
                                : 'من فضلك ادخل المنطقة',
                            style: TextStyle(color: Colors.red, fontSize: 11),
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${AppLocalizations.of(context).trans('regions')}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                defaultFormField(
                  isClickable: true,
                  readOnly: true,
                  controller: regionController,
                  type: TextInputType.text,
                  suffix: Icons.keyboard_arrow_down,
                  validate: (val) {
                    if (val == null || val.isEmpty) {
                      setState(() {
                        regionValidator = true;
                      });
                    } else {
                      setState(() {
                        regionValidator = false;
                      });
                    }
                    return null;
                  },
                  onTap: () {
                    setState(() {
                      regionValidator = false;
                    });
                  },
                ),
                regionValidator
                    ? Align(
                        alignment:
                            AppLocalizations.of(context).locale.languageCode ==
                                    "en"
                                ? Alignment.centerRight
                                : Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            AppLocalizations.of(context).locale.languageCode ==
                                    "en"
                                ? 'Please Enter Region'
                                : 'من فضلك ادخل المنطقة',
                            style: TextStyle(color: Colors.red, fontSize: 11),
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${AppLocalizations.of(context).trans('communication_web_sites')}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 8.0,
                ),
                communicationWebSitesWidget(urlImg: 'images/tiktok.png'),
                communicationWebSitesWidget(urlImg: 'images/snap.png'),
                communicationWebSitesWidget(urlImg: 'images/insta.png'),
                communicationWebSitesWidget(urlImg: 'images/whatapp.png'),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${AppLocalizations.of(context).trans('information_about_the_coach')}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                TextFormField(
                  maxLines: 4,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) {},
                  cursorColor: defaultColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey[300])),
                    focusedErrorBorder: textFormFieldBorder,
                    focusedBorder: textFormFieldBorder,
                    disabledBorder: textFormFieldBorder,
                    errorBorder: textFormFieldBorder,
                    errorStyle: TextStyle(color: defaultColor),
                    contentPadding:
                        EdgeInsets.only(bottom: 10, right: 15, left: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey[300])),
                    suffixIconColor: defaultColor,
                  ),
                ),
                SizedBox(
                  height: 45.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    defaultButton(
                      text: '${AppLocalizations.of(context).trans('next')}',
                      function: () {
                        if (_formKey.currentState.validate()) {}
                        navigateTo(context, CompleteCoachDataScreenStepTwo());
                      },
                      width: media.width * 0.4,
                    ),
                    defaultButton(
                        text: '${AppLocalizations.of(context).trans('back')}',
                        function: () {
                          Navigator.of(context).pop();
                        },
                        width: media.width * 0.4,
                        background: Colors.grey[300]),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompleteCoachDataScreenStepTwo extends StatefulWidget {
  @override
  _CompleteCoachDataScreenStepTwoState createState() =>
      _CompleteCoachDataScreenStepTwoState();
}

class _CompleteCoachDataScreenStepTwoState extends State<CompleteCoachDataScreenStepTwo> {
  bool trainingPlaceValidator = false;
  var trainingPlaceController = TextEditingController();
  bool enableAnotherTrainingPlace = false;
  List<bool> numOfTrainingPlace = [];

  Widget checkedBoxCard(
      {BuildContext context, String text, bool isSelected = false}) {
    return Container(
      width: 330,
      height: 55.0,
      margin: EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(11.0),
          ),
          border: Border.all(color: Colors.grey[300])),
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.grey[300]),
        child: CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          activeColor: Theme.of(context).primaryColor,
          title: defaultSubtitleTextOne(context: context, text: text),
          value: isSelected,
          onChanged: (newValue) {
            setState(() {
              isSelected = newValue;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(context: context, titleKey: 'completing_data2'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0.0),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: defaultColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      )),
                  child: Center(
                      child: Text(
                    '2',
                    style: Theme.of(context).textTheme.headline3,
                  )),
                ),
                title: Text(
                  '${AppLocalizations.of(context).trans('training_places')}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                subtitle: Text(
                  '${AppLocalizations.of(context).trans('step2_of_2')}',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              numOfTrainingPlace.length == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${AppLocalizations.of(context).trans('training_place')}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        defaultFormField(
                            isClickable: true,
                            readOnly: true,
                            controller: trainingPlaceController,
                            type: TextInputType.text,
                            suffix: Icons.keyboard_arrow_down,
                            validate: (val) {
                              if (val == null || val.isEmpty) {
                                setState(() {
                                  trainingPlaceValidator = true;
                                });
                              } else {
                                setState(() {
                                  trainingPlaceValidator = false;
                                });
                              }
                              return null;
                            },
                            onTap: () async {
                              bool waitResult = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChooseTheTrainingPlaceScreen(),
                                ),
                              );
                              if (waitResult) {
                                setState(() {
                                  numOfTrainingPlace.add(true);
                                });
                              }
                            }),
                        trainingPlaceValidator
                            ? Align(
                                alignment: AppLocalizations.of(context)
                                            .locale
                                            .languageCode ==
                                        "en"
                                    ? Alignment.centerRight
                                    : Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Text(
                                    AppLocalizations.of(context)
                                                .locale
                                                .languageCode ==
                                            "en"
                                        ? 'Please Enter Training Place'
                                        : 'من فضلك ادخل مكان التدريب',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 11),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: numOfTrainingPlace.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(11.0)),
                                border: Border.all(color: Colors.grey[300])),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                  child: Text(
                                    'Golds Gym',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      navigateTo(context, ShowSpecificGymScreen());
                                    },
                                    icon: Icon(
                                      Icons.open_in_browser,
                                      color: defaultColor,
                                      size: 22,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        enableAnotherTrainingPlace = false;
                                        numOfTrainingPlace.removeAt(index);
                                      });
                                    },
                                    icon: ImageIcon(
                                      AssetImage('images/deleteIcon.png'),
                                      color: Colors.red,
                                      size: 16.0,
                                    ))
                              ],
                            ),
                          )),
              enableAnotherTrainingPlace == true
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.0,),
                        Text(
                          '${AppLocalizations.of(context).trans('training_place')}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        defaultFormField(
                            isClickable: true,
                            readOnly: true,
                            controller: trainingPlaceController,
                            type: TextInputType.text,
                            suffix: Icons.keyboard_arrow_down,
                            validate: (val) {
                              if (val == null || val.isEmpty) {
                                setState(() {
                                  trainingPlaceValidator = true;
                                });
                              } else {
                                setState(() {
                                  trainingPlaceValidator = false;
                                });
                              }
                              return null;
                            },
                            onTap: () async {
                              bool waitResult = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChooseTheTrainingPlaceScreen(),
                                ),
                              );
                              if (waitResult) {
                                setState(() {
                                  numOfTrainingPlace.add(true);
                                  enableAnotherTrainingPlace = false;
                                });
                              }
                            }),
                        trainingPlaceValidator
                            ? Align(
                                alignment: AppLocalizations.of(context)
                                            .locale
                                            .languageCode ==
                                        "en"
                                    ? Alignment.centerRight
                                    : Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Text(
                                    AppLocalizations.of(context)
                                                .locale
                                                .languageCode ==
                                            "en"
                                        ? 'Please Enter Training Place'
                                        : 'من فضلك ادخل مكان التدريب',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 11),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    )
                  : SizedBox(),
              Text(
                '${AppLocalizations.of(context).trans('training_days')}',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 8.0,
              ),
              checkedBoxCard(
                  context: context,
                  text: '${AppLocalizations.of(context).trans('saturday')}',
                  isSelected: true),
              checkedBoxCard(
                  context: context,
                  text: '${AppLocalizations.of(context).trans('sunday')}',
                  isSelected: true),
              checkedBoxCard(
                  context: context,
                  text: '${AppLocalizations.of(context).trans('monday')}',
                  isSelected: false),
              checkedBoxCard(
                  context: context,
                  text: '${AppLocalizations.of(context).trans('tuesday')}',
                  isSelected: false),
              checkedBoxCard(
                  context: context,
                  text: '${AppLocalizations.of(context).trans('wednesday')}',
                  isSelected: false),
              checkedBoxCard(
                  context: context,
                  text: '${AppLocalizations.of(context).trans('thursday')}',
                  isSelected: false),
              checkedBoxCard(
                  context: context,
                  text: '${AppLocalizations.of(context).trans('friday')}',
                  isSelected: false),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${AppLocalizations.of(context).trans('time_from')}',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${AppLocalizations.of(context).trans('time_to')}',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      onChanged: (val) {},
                      cursorColor: defaultColor,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ImageIcon(
                            AssetImage('images/clock.png'),
                            color: Colors.grey[300],
                            size: 8,
                          ),
                        ),
                        suffixIconConstraints: BoxConstraints(
                            maxHeight: 20,
                            maxWidth: 20,
                            minHeight: 20,
                            minWidth: 20),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey[300])),
                        focusedErrorBorder: textFormFieldBorder,
                        focusedBorder: textFormFieldBorder,
                        disabledBorder: textFormFieldBorder,
                        errorBorder: textFormFieldBorder,
                        errorStyle: TextStyle(color: defaultColor),
                        contentPadding:
                            EdgeInsets.only(bottom: 10, right: 15, left: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey[300])),
                        suffixIconColor: defaultColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      onChanged: (val) {},
                      cursorColor: defaultColor,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ImageIcon(
                            AssetImage('images/clock.png'),
                            color: Colors.grey[300],
                          ),
                        ),
                        suffixIconConstraints: BoxConstraints(
                            maxHeight: 20,
                            maxWidth: 20,
                            minHeight: 20,
                            minWidth: 20),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey[300])),
                        focusedErrorBorder: textFormFieldBorder,
                        focusedBorder: textFormFieldBorder,
                        disabledBorder: textFormFieldBorder,
                        errorBorder: textFormFieldBorder,
                        errorStyle: TextStyle(color: defaultColor),
                        contentPadding:
                            EdgeInsets.only(bottom: 10, right: 15, left: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey[300])),
                        suffixIconColor: defaultColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if(numOfTrainingPlace.length != 0) {
                        setState(() {
                          enableAnotherTrainingPlace = true;
                        });
                        print(enableAnotherTrainingPlace);
                      }
                    },
                    child: Text(
                      '${AppLocalizations.of(context).trans('add_another_place')}',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Color(0xFFcc775a),
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 45.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  defaultButton(
                    text: '${AppLocalizations.of(context).trans('save')}',
                    function: () {
//                        navigateTo(
//                            context, StepThreeInRegisterScreen());
                    },
                    width: media.width * 0.4,
                  ),
                  defaultButton(
                      text: '${AppLocalizations.of(context).trans('back')}',
                      function: () {
                        Navigator.of(context).pop();
                      },
                      width: media.width * 0.4,
                      background: Colors.grey[300]),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
