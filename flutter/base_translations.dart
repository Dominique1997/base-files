import 'dart:convert';
import 'package:"Projectname"/utilities/base_values.dart';
import 'package:flutter/services.dart' show rootBundle;

class Translations {
  static Future<String> findTranslation(text) async {
    AppValues appvalue = AppValues();
    String language = await appvalue.getDefaultLanguage();
    if (language == "English") {
      return text;
    }

    String translationsContent =
        await rootBundle.loadString("translations/$language.json");
    var jsonData = json.decode(translationsContent);
    if (jsonData[text] != null) {
      return jsonData[text];
    }
    return Future(() => "$text-not-translated");
  }
}
