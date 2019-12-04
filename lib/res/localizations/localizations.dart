//1、生成arb文件。
//flutter packages pub run intl_translation:extract_to_arb --output-dir=lib/infrastructures/localizations/l10n lib/infrastructures/localizations/localizations.dart

//2、翻译arb文件。
//3、生成dart文件。
//flutter packages pub run intl_translation:generate_from_arb --output-dir=lib/infrastructures/localizations/l10n --no-use-deferred-loading lib/infrastructures/localizations/localizations.dart lib/infrastructures/localizations/l10n/intl_*.arb

library localizations;


import 'package:app_dev/res/localizations/l10n/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyLocalizations {

  static Future<MyLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return MyLocalizations();
    });
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  ///-----------------------  ------------------------
  String get home => Intl.message('首页' ,desc:'首页',name: 'home');
  String get mime => Intl.message('我的' ,desc:'我的',name: 'mime');








}