import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/app_user.dart';

abstract class Preference {
  static const appUserKey = 'appUser';
  static const authTokenKey = 'authToken';
  static const mazzonIdKey = 'mazzonId';
  static const localeKey = 'appLocale';

  late final ValueNotifier<AppUser?> appUser;

  void saveAppUser(AppUser? appUser);

  void updateAppUser(AppUser? newAppUser);

  String? get token;

  String? get id;

  String? get mazzonId;

  set mazzonId(String? mazzonId);

  set token(String? token);

  Future<bool?> clear();

  void removeAuthPrefs();
}

class LocalPreferences extends Preference {
  late final SharedPreferences? sharedPreferences;

  LocalPreferences({required this.sharedPreferences}) {
    appUser = ValueNotifier<AppUser?>((sharedPreferences
        ?.getString(Preference.appUserKey) !=
        null)
        ? AppUser.fromJson(
        json.decode(sharedPreferences!.getString(Preference.appUserKey)!))
        : null);
  }

  @override
  void updateAppUser(AppUser? newAppUser) {
    appUser.value = newAppUser;
    saveAppUser(newAppUser);
  }

  @override
  String? get token => sharedPreferences?.getString(Preference.authTokenKey);

  @override
  Future<bool?> clear() {
    return sharedPreferences?.clear() ?? Future(() => false);
  }

  @override
  void removeAuthPrefs() {
    sharedPreferences?.remove(Preference.appUserKey);
    sharedPreferences?.remove(Preference.authTokenKey);


  }

  @override
  set token(String? token) => token == null
      ? sharedPreferences?.remove(Preference.authTokenKey)
      : sharedPreferences?.setString(Preference.authTokenKey, token);

  @override
  void saveAppUser(AppUser? appUser) => appUser == null
      ? sharedPreferences?.remove(Preference.appUserKey)
      : sharedPreferences?.setString(
      Preference.appUserKey, json.encode(appUser.toJson()));

  @override
  String? get id => appUser.value?.id;

  @override
  set mazzonId(String? mazzonId) => mazzonId == null
      ? sharedPreferences?.remove(Preference.mazzonIdKey)
      : sharedPreferences?.setString(Preference.mazzonIdKey, mazzonId);

  @override
  String? get mazzonId => sharedPreferences?.getString(Preference.mazzonIdKey);
}
