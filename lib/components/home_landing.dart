import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Landing extends StatelessWidget {
  Landing({super.key});

  final CarouselOptions options =
      CarouselOptions(height: 600.0, autoPlay: true);

  //TODO images in this list
  final items = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            CarouselSlider(
              options: options,
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
            ),
            Positioned(
              bottom: -50,
              child: ElevatedButton(
                onPressed: () => null, //TODO take to the contact form
                child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width / 4,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: const Text('call to action button')), //TODO Styles
              ),
            )
          ],
        ),
      ],
    );
  }
}
