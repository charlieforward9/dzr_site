///TO CALL flutterfire configure,
///export PATH="$PATH":"$HOME/.pub-cache/bin"
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dzr_site/firebase.dart';
import 'package:dzr_site/views/views.dart';
import 'package:dzr_site/components/components.dart';
import 'package:seo_renderer/seo_renderer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await cloudOps.configFirebase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RobotDetector(
      debug: kDebugMode,
      child: MaterialApp(
          title: 'South Florida Public Adjuster',
          navigatorObservers: [
            seoRouteObserver
          ],
          routes: {
            "/": (context) => const Header(
                  name: 'home',
                  body: HomeView(),
                ),
            "/residential": (context) => const Header(
                  name: 'residential',
                  body: ResidentialView(),
                ),
            "/commercial": (context) => const Header(
                  name: 'commercial',
                  body: CommercialView(),
                ),
            "/contact": (context) => const Header(
                  name: 'contact',
                  body: ContactView(),
                ),
            "/admin": (context) => Header(
                  name: 'admin',
                  body: AdminView(),
                )
          }),
    );
  }
}
