import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seo_renderer/renderers/link_renderer/link_renderer_web.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize(context).height / 6,
      decoration: const BoxDecoration(color: secondaryColor),
      child: Center(
          child: Column(
        children: [
          const Spacer(),
          socialBanner(),
          const PageRouter(name: "admin"),
          const Spacer(),
        ],
      )),
    );
  }
}

Widget socialBanner() {
  const String insta = "https://www.instagram.com/homeclaimsadjuster/";
  const String facebook = "https://www.facebook.com/Dzrobins77";
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      LinkRenderer(
        text: "Instagram",
        href: insta,
        child: IconButton(
            icon: const FaIcon(FontAwesomeIcons.instagram),
            onPressed: () async {
              if (!await launchUrl(
                Uri.parse(insta),
                mode: LaunchMode.externalApplication,
              )) {
                throw 'Could not launch url';
              }
            }),
      ),
      LinkRenderer(
        text: "Facebook",
        href: facebook,
        child: IconButton(
            icon: const FaIcon(FontAwesomeIcons.facebook),
            onPressed: () async {
              if (!await launchUrl(
                Uri.parse(facebook),
                mode: LaunchMode.externalApplication,
              )) {
                throw 'Could not launch url';
              }
            }),
      )
    ],
  );
}
