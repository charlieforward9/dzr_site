import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      decoration: const BoxDecoration(color: secondaryColor),
      child: Center(
          child: Column(
        children: [
          const Spacer(),
          Text("Here to get you moving forward", style: subTitleStyle),
          Text(
              "ClaimPros' licensed Public Adjusters help businesses and home owners settle claims by assessing the damage and documenting every detail of property loss. Our adjusters represent you and will prepare and submit your claim to the insurance company.",
              style: paragraphStyle),
          //socialBanner(context),
          const Spacer(),
        ],
      )),
    );
  }
}

//TODO fix permissions to get font awesome Icons
Widget socialBanner(BuildContext context) {
  return Row(
    children: [
      IconButton(
          icon: const FaIcon(FontAwesomeIcons.squareInstagram),
          onPressed: () async {
            if (!await launchUrl(
              Uri.parse("https://www.instagram.com/homeclaimsadjuster/"),
              mode: LaunchMode.externalApplication,
            )) {
              throw 'Could not launch url';
            }
          }),
      IconButton(
          icon: const FaIcon(FontAwesomeIcons.facebook),
          onPressed: () async {
            if (!await launchUrl(
              Uri.parse("https://www.facebook.com/Dzrobins77"),
              mode: LaunchMode.externalApplication,
            )) {
              throw 'Could not launch url';
            }
          })
    ],
  );
}
