import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';

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
      title: TextRenderer(child: Text(title)),
      content: TextRenderer(child: Text(content)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: headerButtonStyle,
            onPressed: secondaryCallback,
            child: TextRenderer(child: Text(secondaryAction)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: actionButtonStyle,
            onPressed: primaryCallback,
            child: TextRenderer(child: Text(primaryAction)),
          ),
        ),
      ],
    ),
  );
}
