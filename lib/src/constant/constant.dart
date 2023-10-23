
import 'package:flutter/cupertino.dart';

const String host = 'https://dientrang.thietkeapp.asia';
const String tokenDev = 'Gb19afYr1tpSu3AWJ117NBh95Q4h1Wewr0gq9Un2iQKn91a23dcvd';

const int defaultLimit = 2000;

enum AppLanguage { vi, en }

class AppType {
  static int guest = 1;
  static int agent = 2;
  static int leader = 3;
}

class LocalityType {
  static int province = 1;
  static int district = 2;
  static int ward = 3;
}

class ResponseStatus {
  static int success = 0;
}

extension StringExtension on String {
  String toUrl() {
    if (contains(host) || isEmpty) {
      return this;
    }
    return '$host/$this';
  }

  int toInt() {
    return int.tryParse(this) ?? 0;
  }
}

class LocalStorageKey {
  final String tokenKey = "tokenKey";
  final String firebaseTokenKey = "firebaseTokenKey";
  final String tempTokenKey = "tempTokenKey";
  final String languageKey = "languageKey";
  final String searchHistoryKey = "searchHistoryKey";
  final String userInfo = "userInfo";
  final String isLogin = "isLogin";
  final String tokenDev = "tokenDev";
}

enum HomeHeaderType { category, news, agent }

enum MenuAccountType {
  profile,
  password,
  policy,
  contact,
  logout,
  deleteAccount
}
