import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      decoration: const BoxDecoration(color: secondaryColor),
      child: Center(
          child: Column(
        children: [
          const Spacer(),
          const PageRouter(name: "admin"),
          socialBanner(context),
          const Spacer(),
        ],
      )),
    );
  }
}

Widget socialBanner(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
          icon: const FaIcon(FontAwesomeIcons.instagram),
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
