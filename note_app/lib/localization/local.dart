// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';

// class DemoLocalizations  {
//   final Locale locale;

//   DemoLocalizations (this.locale);
//   static DemoLocalizations of(BuildContext context) {
//     return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
//   }

//   Map<String, String> _localizedValues;
//   Future load() async {
//     String jsonStringValues =
//         await rootBundle.loadString('lang/${locale.languageCode}.json');
//     Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
//     _localizedValues = mappedJson.map((key, value) => MapEntry(key, value));

//     String getTranslatedValue(String key) {
//       return _localizedValues[key];
//     }
//   }
//   class _DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
//   //const DemoLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);
//       return ['en-US','vn-VN'].contains(locale.languageCode);
//   @override
//   Future<DemoLocalizations> load(Locale locale) {
//     //return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
//     DemoLocalizations localizations = new DemoLocalizations(locale);
//     await localizations.load(locale);
//   }

//   @override
//   bool shouldReload(_DemoLocalizationsDelegate old) => false;
//   }
// }
