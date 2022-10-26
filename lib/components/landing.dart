import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Landing extends StatelessWidget {
  Landing({super.key});

  final items = {1, 2, 3};

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: IgnorePointer(
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                aspectRatio: 16 / 11,
                autoPlay: true,
              ),
              items: items.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image(
                      fit: BoxFit.cover,
                      image: AssetImage('landing$i.jpg'),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
        ElevatedButton(
          style: buttonStyle,
          onPressed: () => Navigator.of(context).pushNamed('/contact'),
          child: Container(
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width / 4,
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Center(
              child: Text(
                'File your claim, correctly!',
                style: actionStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
