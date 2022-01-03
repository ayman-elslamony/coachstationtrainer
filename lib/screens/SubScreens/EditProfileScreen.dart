import 'package:coachstationtrainer/Helper/components.dart';
import 'package:coachstationtrainer/Localization/app_localizations.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    nameController.text = 'أنس حافظ';
    phoneController.text = '01234567891';
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(context: context,
      titleKey: 'edit_personal_page',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: media.height*0.75,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.0,),
                      Container(
                        height: media.height*0.37,
                        width: media.width*0.74,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Align(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  'images/userProfile.png',
                                  fit: BoxFit.fill,
                                  height: media.height*0.35,
                                  width: media.width*0.7,
                                ),
                              ),
                              alignment: AlignmentDirectional.topCenter,
                            ),
                            CircleAvatar(
                              radius: 29.0,
                              backgroundColor:
                              Theme.of(context).primaryColor,
                              child: CircleAvatar(
                                radius: 18.0,
                                backgroundColor: Theme.of(context).primaryColor,
                                backgroundImage: AssetImage('images/camera.png'),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 70,
                      ),
                      defaultFormField(
                        controller: nameController,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return '${AppLocalizations.of(context).trans('invalid_name')}';
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      defaultFormField(
                        controller: phoneController,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return '${AppLocalizations.of(context).trans('invalid_phone_num')}';
                          }

                          return null;
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
            defaultButton(
                function: () {},
                text: '${AppLocalizations.of(context).trans('save')}',
                width: media.width * 0.7),
          ],
        ),
      )
    );
  }
}
