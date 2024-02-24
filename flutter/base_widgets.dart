import 'package:flutter/material.dart';
import 'package:"Project_name"/utilities/base_actions.dart';
import 'package:"Project_name"/utilities/translations.dart';

class BaseWidgets {
  late List<DropdownMenuItem> languagesMenuItem;
  late String selectedLanguage;
  late AppActions appActions;

  BaseWidgets() {
    appActions = AppActions();
  }

  Icon widgetIcon(IconData icon) {
    return Icon(icon);
  }

  Widget widgetNavigationIconButton(IconData icon, String hintText, context,
      [navigateToPage]) {
    return FutureBuilder(
        future: Translations.findTranslation(hintText),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return IconButton(
                icon: widgetIcon(icon),
                tooltip: snapshot.data,
                onPressed: () =>
                    appActions.navigateTo(context, navigateToPage));
          }
        });
  }

  Widget widgetActionIconButton(
      IconData icon, String hintText, Function() action) {
    return FutureBuilder(
        future: Translations.findTranslation(hintText),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return IconButton(
                onPressed: action,
                tooltip: snapshot.data,
                icon: widgetIcon(icon));
          }
        });
  }

  SizedBox widgetSizedBox([childElement = Widget]) {
    return SizedBox(
      width: 500,
      child: childElement,
    );
  }

  widgetTextField(String shownHinttext, bool enabled, bool obscureText,
      ValueChanged<String> onChanged, TextInputType typeOfInput,
      [defaultText]) {
    return FutureBuilder(
        future: Translations.findTranslation(shownHinttext),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return TextField(
              controller: TextEditingController(text: defaultText ?? ""),
              decoration: InputDecoration(
                enabled: enabled,
                border: const OutlineInputBorder(),
                hintText: snapshot.data,
              ),
              onChanged: onChanged,
              obscureText: obscureText,
              keyboardType: typeOfInput,
            );
          }
        });
  }

  Text widgetMainTitle(String mainTitle, double sizeOfText) {
    return Text(mainTitle, style: TextStyle(fontSize: sizeOfText));
  }

  Widget widgetTextLable(String text) {
    return FutureBuilder(
        future: Translations.findTranslation(text),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          return Text(
            snapshot.data.toString(),
            style: const TextStyle(fontSize: 20),
          );
        });
  }
}
