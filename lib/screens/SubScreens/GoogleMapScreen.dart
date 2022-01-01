import 'package:coachstationtrainer/Helper/components.dart';
import 'package:flutter/material.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        titleKey: 'map',
      ),
      body:  Padding(
      padding: const EdgeInsets.all(8.0),
    child: Container(
    child: Center(
    child: defaultButton(function: null, text: 'Show Map Here'),
    ))

    ));
  }
}
