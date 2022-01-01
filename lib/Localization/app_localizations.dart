import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class AppLocalizations {

  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _sentences;

  Future<bool> load() async {

    String data = await rootBundle.loadString('assets/i18n/${this.locale.languageCode}.json');
    Map<String, dynamic> _result = json.decode(data);

    this._sentences = new Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });

    return true;

  }

  String trans(String key) {
    return this._sentences[key];
  }

  dynamic select (Map<String, dynamic> options) {

    return options[locale.languageCode];

  }

}
