import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Landing(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(children: [
            Text(
                "It can be very confusing, emotional, and stressful when your home or business is damaged. Insurance contracts are complicated and present a complexity of mandatory insurance policy obligations and conditions, which are required to be completed timely or your coverage may be severely limited or even denied. Claim Pros is proud to offer its clients over 100+ years of combined claim experience across Florida.",
                style: paragraphStyle),
            Text(
                "Our public adjusters have helped tens of thousands of our clients with damage assessments, appraisals, litigation support, and much more. Our licensed public adjusters routinely help Florida homeowners and businesses settle their claims fully and fairly by accurately assessing their damages and documenting every detail of their loss. As a fiduciary, our Florida public adjusters only represent our client's best interests and will document, prepare, and present your claim, while working collaboratively with your insurance company to expedite a resolution.",
                style: paragraphStyle),
            Text(
                "No matter what kind of damage you have suffered, our licensed public adjusters can help you secure a full and fair claims settlement. Call Claim Pros today and learn more about our FREE claim and policy reviews.",
                style: paragraphStyle)
          ]),
        ),
        const Footer()
      ],
    ));
    //const CuratorComponent(), //Unable to scroll past this component
  }
}
