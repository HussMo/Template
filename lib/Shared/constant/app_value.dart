import 'package:flutter/material.dart';

class AppValues {
  /// App name
  static const String appName = 'Template';

  /// Base Url
  static const String baseUrl = '';

  /// Image Url
  static const String imageUrl = '';

  /// Api Key
  static const String apiKey = '';

  /// en lang code
  static const String langCodeEn = 'en';

  /// uk lang code
  static const String langCodeUk = 'uk';

  /// Hero tag for poster
  static const String heroPoster = '';

  /// basic lang code
  static const String langCodeBasic = langCodeEn;

  /// Locale uk
  static const Locale localeUK = Locale(langCodeUk);

  /// Locale en
  static const Locale localeEN = Locale(langCodeEn);

  /// Supported locales (en, de)
  static const List<Locale> supportedLocales = <Locale>[
    localeUK,
    localeEN,
  ];

  /// locales path
  static const String localesPath = '';

}
