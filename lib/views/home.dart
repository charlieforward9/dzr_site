import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Landing(),
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 200,
            maxHeight: 1000,
            minWidth: screenSize(context).width * 0.8,
            maxWidth: screenSize(context).width * 0.95,
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 100,
                maxHeight: 250,
              ),
              child: Text("Insurance contracts are complicated",
                  style: titleStyle, textAlign: TextAlign.center),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 70,
                maxHeight: 200,
              ),
              child: Text(
                  "I am proud to offer over 3+ years of claim experience across Florida.",
                  style: subTitleStyle,
                  textAlign: TextAlign.center),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 100,
                maxHeight: 400,
              ),
              child: Text(
                  "Damage assessments, appraisals, litigation support, and much more. As a fiduciary, I represent my client's best interests and will document, prepare, and present your claim, while working collaboratively with your insurance company to expedite a resolution.",
                  style: paragraphStyle,
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 10),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 100,
                maxHeight: 350,
              ),
              child: Text(
                  "Call me today and learn more about FREE claim and policy reviews.",
                  style: subTitleStyle,
                  textAlign: TextAlign.center),
            ),
          ]),
        ),
        const Footer()
      ],
    );
    //const CuratorComponent(), //Unable to scroll past this component
  }
}
