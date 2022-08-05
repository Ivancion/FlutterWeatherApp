import 'package:flutter/cupertino.dart';

class LocalizationInfo {
  String getCurrentLocale(BuildContext context) {
    return Localizations.localeOf(context).toLanguageTag();
  }
}
