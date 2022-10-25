import 'package:carousel_slider/carousel_slider.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';

class ProcessCarousel extends StatelessWidget {
  ProcessCarousel({super.key});

  final items = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  final List<String> processText = [
    "",
    "LIFE & SAFETY ISSUES",
    "MITIGATION OF DAMAGES",
    "ESTABLISH A RECOVERY STRATEGY",
    "ANALYSIS OF COVERAGES",
    "VALUATION OF DAMAGES",
    "NEGOTIATIONS & SETTLEMENT",
    "RESTORATION OF PROPERTY & OPERATIONS",
    "ANOTHER HAPPY CLAIMPROS CLIENT!",
    ""
  ];

  @override
  Widget build(BuildContext context) {
    final CarouselOptions options = CarouselOptions(
      height: MediaQuery.of(context).size.width / 5,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 1),
      autoPlayAnimationDuration: const Duration(seconds: 1),
      viewportFraction: 0.2,
      autoPlayCurve: Curves.linear,
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: Column(
          children: [
            Text("CLAIMS RECOVERY PROCESS", style: subTitleStyle),
            const Spacer(),
            CarouselSlider(
                items: items.map((i) {
                  if (i == 0) {
                    return Center(
                      child: Text(
                        "Claims \nRecovery \nProcess",
                        textAlign: TextAlign.end,
                        softWrap: true,
                        style: subTitleStyle,
                      ),
                    );
                  }
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image(image: AssetImage("crp$i.png")),
                            Container(
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Text(
                                processText[i],
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: captionStyle,
                                maxLines: 2,
                              ),
                            )
                          ]);
                    },
                  );
                }).toList(),
                options: options),
          ],
        ),
      ),
    );
  }
}
