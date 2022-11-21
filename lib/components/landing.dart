import 'package:dzr_site/cubit/firebase_cubit.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});
  final String path = "home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirebaseCubit()..getContent(path),
      child: BlocBuilder<FirebaseCubit, FirebaseState>(
        builder: (context, state) {
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: IgnorePointer(
                  child: () {
                    if (state is FirebaseLoaded) {
                      return CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          aspectRatio: 16 / 11,
                          autoPlay: true,
                        ),
                        items: state.firebaseImages.map((fbImg) {
                          return Builder(
                            builder: (BuildContext context) {
                              return fbImg.img!;
                            },
                          );
                        }).toList(),
                      );
                    }
                    if (state is FirebaseLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is FirebaseError) {
                      return Text(state.error.toString());
                    }
                  }(),
                ),
              ),
              ElevatedButton(
                style: landingButtonStyle,
                onPressed: () => Navigator.of(context).pushNamed('/contact'),
                child: Container(
                  // height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 4,
                  margin: const EdgeInsets.all(10.0),
                  child: Center(
                    child: RichText(
                      text: TextSpan(children: const [
                        TextSpan(text: 'Get the coverage you deserve\n'),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                                Icons.keyboard_double_arrow_right_outlined,
                                color: Colors.white))
                      ], style: actionStyle),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
