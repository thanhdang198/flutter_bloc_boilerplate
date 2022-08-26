import 'package:flutter/material.dart';

import '../utils/hive.dart';


class AppLanguage extends ChangeNotifier {
  Locale _appLocale = const Locale('vi');

  Locale get appLocal => _appLocale;
  fetchLocale() async {
    if (HiveData().getData(key: 'language_code') == null) {
      _appLocale = const Locale('vi');
      return Null;
    }
    _appLocale = Locale(await HiveData().getData(key: 'language_code'));
    return Null;
  }

  void changeLanguage(Locale type) async {
    if (_appLocale == type) {
      return;
    }
    if (type == const Locale("vi")) {
      _appLocale = const Locale("vi");
      await HiveData().writeData(key: 'language_code', data: 'vi');
      await HiveData().writeData(key: 'countryCode', data: 'VN');
    } else {
      _appLocale = const Locale("en");
      await HiveData().writeData(key: 'language_code', data: 'en');
      await HiveData().writeData(key: 'countryCode', data: 'US');
    }
    notifyListeners();
  }
}
