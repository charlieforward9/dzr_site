import 'package:flutter/material.dart';
import 'dart:ui' as ui;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class CuratorComponent extends StatelessWidget {
  const CuratorComponent({super.key});

  final viewID = 'curatorView';

  @override
  //TODO enable scrolling over this widget
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        viewID,
        (int id) => IFrameElement()
          ..src = 'assets/curator.html'
          ..style.border = 'none'
          ..style.height = '100%'
          ..style.width = '100%');

    //TODO this shouldnt have to be here, waiting on Github fix
    return Stack(
      children: [
        SizedBox(
          height: 540,
          child: HtmlElementView(
            viewType: viewID,
          ),
        ),
        Container(),
      ],
    );
  }
}
