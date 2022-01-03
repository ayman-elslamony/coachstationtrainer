// ignore_for_file: file_names, unnecessary_this

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeIndex with ChangeNotifier {
  int index =1;
  bool isMain=false;

  int _currentTab=0;
  // List<Widget> _screens = [];

  set currentTabb(int tab){this._currentTab = tab;  notifyListeners();}
  get currentTabb => this._currentTab;
  set currentScreenn(int tab){this._currentTab = tab;  notifyListeners();}
  get currentTab=> this.index;

  void changeIndexFunction(int index) {
    this.index = index;
    this.isMain=true;
    notifyListeners();
  }
  void changeIndexFunctionWithOutNotify(int index) {
    this.index = index;
    this.isMain=true;
  }

  List<bool> _isAddressSelected = [false, false, false, false, false];

  onSelect(int addressIndex){
    for(int i=0; i < _isAddressSelected.length; i++){
      _isAddressSelected[i] = false;
    }

    _isAddressSelected[addressIndex] = true;
    notifyListeners();
  }


}