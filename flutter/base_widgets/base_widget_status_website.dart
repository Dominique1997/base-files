import 'package:flutter/material.dart';
import 'package:ncc_app/utilities/base/base_widgets/base_widget_main_title.dart';

class BaseWidgetStatusWebsite extends StatelessWidget {
  final String websiteName;
  final String websiteUrl;
  final bool websiteStatus;
  const BaseWidgetStatusWebsite(
      {super.key,
      required this.websiteName,
      required this.websiteUrl,
      required this.websiteStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, style: BorderStyle.solid),
          color: websiteStatus ? Colors.green : Colors.red),
      child: Column(children: [
        BaseWidgetMainTitle(mainTitle: websiteName, sizeOfText: 20),
        BaseWidgetMainTitle(mainTitle: websiteUrl, sizeOfText: 15),
        BaseWidgetMainTitle(mainTitle: websiteStatus.toString(), sizeOfText: 10)
      ]),
    );
  }
}
