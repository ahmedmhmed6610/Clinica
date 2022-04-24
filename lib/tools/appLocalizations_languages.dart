import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizationsLanguages {
  static final AppLocalizationsLanguages _singleton = new AppLocalizationsLanguages._internal();
  AppLocalizationsLanguages._internal();
  static AppLocalizationsLanguages get instance => _singleton;

  Map<dynamic, dynamic>? _localisedValues;

  Future<AppLocalizationsLanguages> load(Locale locale) async {
    String jsonContent =
    await rootBundle.loadString("assets/lang/${locale.languageCode}.json");
        _localisedValues = json.decode(jsonContent);
    return this;
  }

  String text(String key) {
    return _localisedValues![key] ?? "$key not found";
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizationsLanguages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizationsLanguages> load(Locale locale)  {
    return AppLocalizationsLanguages.instance.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => true;
}
