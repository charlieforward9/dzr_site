import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';

class CommercialView extends StatelessWidget {
  const CommercialView({super.key});

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
                  top: MediaQuery.of(context).size.height * -1.5,
                  child: const Image(
                    image: AssetImage("commercial.jpg"),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 4,
                  child: Container(
                    decoration: titleBox,
                    child: Text("OUR BUSINESS FOR YOUR BUSINESS",
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
                    "Commercial insurance claims present a complexity of mandatory insurance policy obligations and conditions, which are required to be completed timely or your coverage may be severely limited or even denied. Claim Pros is proud to offer its clients over 100+ years of combined claim experience across Florida. Our public adjusters can help with damage assessments, appraisals, litigation support, and much more.",
                    style: paragraphStyle),
                const Spacer(),
                Text(
                    "Our licensed public adjusters routinely help Florida businesses settle their claims fully and fairly by accurately assessing their damages and documenting every detail of their loss. As a fiduciary, our Florida public adjusters only represent our client's best interests and will document, prepare, and present your claim, while working collaboratively with your insurance company to expediate a resolution. Our Florida public adjusters will ensure that you receive a full and fair settlement.",
                    style: paragraphStyle),
                const Spacer(),
                Text(
                    "Those meetings and inventory documentation requirements increase the opportunity cost for many business owners and executives which take precious time away from work and family obligations. Let Claim Pros' public adjusters navigate your claim process on your behalf, so you can focus on expediting your business recovery.",
                    style: paragraphStyle),
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
      ),
    );
  }
}
