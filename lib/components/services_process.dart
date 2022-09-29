import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProcessCarousel extends StatelessWidget {
  const ProcessCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselOptions options = CarouselOptions(
      height: MediaQuery.of(context).size.width / 5,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 1),
      autoPlayAnimationDuration: const Duration(seconds: 1),
      viewportFraction: 0.2,
      autoPlayCurve: Curves.elasticOut,
    );

    final items = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

    return CarouselSlider(
        items: items.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Text('image $i'));
            },
          );
        }).toList(),
        options: options);
  }
}
