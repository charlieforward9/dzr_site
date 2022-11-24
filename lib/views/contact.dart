import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height / -1,
                child: const Image(
                  image: AssetImage("dan.jpg"),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 5,
                child: Container(
                  decoration: titleBox,
                  child: Text("CONTACT US",
                      style: titleStyle, textAlign: TextAlign.center),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 3,
                child: const ContactForm(),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
