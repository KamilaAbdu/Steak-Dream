// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10ns {
  L10ns();

  static L10ns? _current;

  static L10ns get current {
    assert(
      _current != null,
      'No instance of L10ns was loaded. Try to initialize the L10ns delegate before accessing L10ns.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10ns> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10ns();
      L10ns._current = instance;

      return instance;
    });
  }

  static L10ns of(BuildContext context) {
    final instance = L10ns.maybeOf(context);
    assert(
      instance != null,
      'No instance of L10ns present in the widget tree. Did you add L10ns.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static L10ns? maybeOf(BuildContext context) {
    return Localizations.of<L10ns>(context, L10ns);
  }

  /// `Главная`
  String get mainNavigationBarItem {
    return Intl.message(
      'Главная',
      name: 'mainNavigationBarItem',
      desc: '',
      args: [],
    );
  }

  /// `Избранные`
  String get favoriteNavigationBarItem {
    return Intl.message(
      'Избранные',
      name: 'favoriteNavigationBarItem',
      desc: '',
      args: [],
    );
  }

  /// `Каталог`
  String get catalogNavigationBarItem {
    return Intl.message(
      'Каталог',
      name: 'catalogNavigationBarItem',
      desc: '',
      args: [],
    );
  }

  /// `Корзина`
  String get cartNavigationBarItem {
    return Intl.message(
      'Корзина',
      name: 'cartNavigationBarItem',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profileNavigationBarItem {
    return Intl.message(
      'Профиль',
      name: 'profileNavigationBarItem',
      desc: '',
      args: [],
    );
  }

  /// `Бонусная карта`
  String get loyaltyProgramTitle {
    return Intl.message(
      'Бонусная карта',
      name: 'loyaltyProgramTitle',
      desc: '',
      args: [],
    );
  }

  /// `Покажите QR-код кассиру чтобы поменятьь их.`
  String get loyaltyProgramSubTitle {
    return Intl.message(
      'Покажите QR-код кассиру чтобы поменятьь их.',
      name: 'loyaltyProgramSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dreamчиков`
  String get loyaltyProgramCount {
    return Intl.message(
      'Dreamчиков',
      name: 'loyaltyProgramCount',
      desc: '',
      args: [],
    );
  }

  /// `Попробуйте новый вкус`
  String get promotionItemTitle {
    return Intl.message(
      'Попробуйте новый вкус',
      name: 'promotionItemTitle',
      desc: '',
      args: [],
    );
  }

  /// `Приходите за новым вкусом`
  String get promotionItemSubTitle {
    return Intl.message(
      'Приходите за новым вкусом',
      name: 'promotionItemSubTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10ns> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ky'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10ns> load(Locale locale) => L10ns.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
