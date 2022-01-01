// ignore_for_file: file_names, constant_identifier_names, prefer_final_fields, unnecessary_this

import 'dart:async';
import 'dart:convert';
 
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:coachstationtrainer/Helper/Helper.dart';
import 'package:coachstationtrainer/main.dart';
//import 'package:coachstation/models/HomeModel.dart';
//import 'package:coachstation/models/category.dart';
//import 'package:coachstation/models/Product.dart';
//import 'package:coachstation/models/notification.dart';
enum HomeStage {DONE,LOADING,ERROR}

class HomeProvider extends ChangeNotifier {

  HomeStage homeStage;

// get Home Data

//  HomeModel _homeData;
//  HomeModel get homeData=>_homeData;

//  Future getHomeData({context, locale}) async {
//    this.homeStage = HomeStage.LOADING;
//    String url = '$domain/api/home?api_token=${Helper.token}';
//
//    var headers = {
//      'Accept': 'application/json',
//      'Content-Type': 'application/json',
//      'X-localization' : locale.toString()
//    };
//
//    // try {
//      http.Response response = await http.get(Uri.parse(url), headers: headers);
//      var responseJson = json.decode(response.body);
//
//    if (response.statusCode == 200 && responseJson['success'] == true) {
//        this.homeStage = HomeStage.DONE;
//        dynamic homeData = responseJson['data'];
//
//        if(homeData != null ){
//          _homeData = HomeModel.fromJson(homeData);
//        }
//
//      } else {
//        this.homeStage = HomeStage.ERROR;
//        var errors = responseJson['errors']??responseJson['message'];
//
//        String finalError = '';
//        if (responseJson['errors']!=null) {
//          errors.forEach((key, errors) {
//            finalError += "${responseJson['errors']!=null ? errors[0] : errors}\n\n";
//          });
//        }
//        showAlertDialog(context, content: finalError==''?'${errors}':finalError);
//      }
//    // } catch (e) {
//    //   this.stage = HomeStage.ERROR;
//    //   print(e);
//    //   throw e;
//    // }
//    notifyListeners();
//  }



}