import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: actionButtonStyle,
      onPressed: () => Navigator.of(context).pushNamed('/contact'),
      child: Container(
        width: screenSize(context).width / 2,
        margin: const EdgeInsets.all(10.0),
        child: Center(
          child: RichText(
            text: TextSpan(children: const [
              TextSpan(text: 'Get the coverage you deserve\n'),
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(Icons.keyboard_double_arrow_right_outlined,
                      color: Colors.white))
            ], style: actionStyle),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
