import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';

Future<void> consentDialog(
    BuildContext context,
    String title,
    String content,
    String secondaryAction,
    String primaryAction,
    Function() secondaryCallback,
    Function() primaryCallback) {
  return showDialog(
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: headerButtonStyle,
            onPressed: secondaryCallback,
            child: Text(secondaryAction),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: landingButtonStyle,
            onPressed: primaryCallback,
            child: Text(primaryAction),
          ),
        ),
      ],
    ),
  );
}
