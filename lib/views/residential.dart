import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';

class ResidentialView extends StatelessWidget {
  const ResidentialView({super.key});

  static const Set<String> services = {
    "Bid comparison and analysis",
    "Separation of damaged from undamaged goods",
    "Itemized contents inventory",
    "Valuation for replacement and actual cash values",
    "Determination of sales tax and acquisition time to replace total loss items",
    "Preparation of additional living expense (“ALE”) expenses, co-insurance calculations",
    "Preparation and filing of proof of loss forms."
  };

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height / -2,
                child: const Image(
                  image: AssetImage("residential.jpg"),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 4,
                child: Container(
                  decoration: titleBox,
                  child: Text("IT'S NOT A HOUSE\nIT'S YOUR HOME",
                      style: titleStyle, textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(children: [
              Text(
                "When a residential property owner suffers damage resulting in a covered insurance claim, a complexity of mandatory insurance policy obligations and conditions, are required to be completed timely or your coverage may be severely limited or even denied.",
                style: paragraphStyle,
              ),
              const Spacer(),
              Text(
                "For most policyholders, navigating an insurance claim can be a very confusing, emotional, and stressful process. Depending on the size and complexity of the claim, the policyholder may need to secure temporary housing, our Florida public adjusters can document, prepare, and present these out of pocket expenses to make sure your reimbursement is expedited.",
                style: paragraphStyle,
              ),
              const Spacer(),
              Text(
                "Policyholders typically have difficulties quantifying depreciation, distinguishing the appropriateness of replacement versus repair costs, and preparing reimbursement for additional living expenses. In some situations where a damaged item should have been replaced rather than repaired or cleaned, the insurance company may be required to subsequently replace the damaged item even beyond the stated policy limits.",
                style: paragraphStyle,
              ),
              const Spacer(),
              Text(
                  "No matter what kind of damage you have suffered, our licensed public adjusters can help you secure a full and fair claims settlement. Call Claim Pros today and learn more about our FREE claim and policy reviews.",
                  style: paragraphStyle),
              const Spacer(),
            ])),
        ProcessCarousel(),
        const ContactForm(),
        const Footer()
      ],
    ));
  }
}
