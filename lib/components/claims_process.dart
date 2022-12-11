import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';

class ClaimsProcess extends StatelessWidget {
  const ClaimsProcess({super.key});

  static final List<String> process = [
    "LIFE & SAFETY ISSUES",
    "MITIGATION OF DAMAGES",
    "ESTABLISH A RECOVERY STRATEGY",
    "ANALYSIS OF COVERAGES",
    "VALUATION OF DAMAGES",
    "NEGOTIATIONS & SETTLEMENT",
    "RESTORATION OF PROPERTY & OPERATIONS",
    "ANOTHER HAPPY CLAIMPROS CLIENT!",
  ];

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(
            minHeight: 400, maxHeight: 650, minWidth: 600.0),
        child: Column(
          children: [
            TextRenderer(
              child: Text("CLAIMS RECOVERY PROCESS",
                  style: titleStyle, textAlign: TextAlign.center),
            ),
            Column(
                children: process
                    .map<Widget>((i) => Builder(
                        builder: (BuildContext context) => Container(
                            alignment: Alignment.center,
                            color: process.indexOf(i) == process.length - 1
                                ? actionColor
                                : secondaryColor
                                    .withOpacity(process.indexOf(i) / 10 + 0.1),
                            height: screenSize(context).height / 18,
                            child: TextRenderer(
                              child: Text(
                                i,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: captionStyle,
                                maxLines: 1,
                              ),
                            ))))
                    .toList()),
            const Spacer(),
            const ContactButton(),
            const Spacer(flex: 2),
          ],
        ),
      );
}
