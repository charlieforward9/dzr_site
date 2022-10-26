import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';

class FileDialog extends StatelessWidget {
  final int files;

  const FileDialog({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 56.0), //FAB height
      child: Dialog(
        alignment: Alignment.bottomRight,
        child: Container(
          decoration: const BoxDecoration(color: primaryColor),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              children: buildCompleteFileSelector(context)),
        ),
      ),
    );
  }

  //Builds the dialog box with enough single file selectors to fulfill the user request based on the tabs purpose
  List<Widget> buildCompleteFileSelector(BuildContext context) {
    List<Widget> fileSelector = [];
    for (var i = 1; i <= files; i++) {
      fileSelector.add(const FileSelector());
      if (i != files) {
        fileSelector.add(const SizedBox(width: 5));
      }
    }
    return fileSelector;
  }
}
