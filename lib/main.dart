///TO CALL flutterfire configure,
///export PATH="$PATH":"$HOME/.pub-cache/bin"
import 'package:flutter/material.dart';

import 'firebase.dart';
import 'views/views.dart';
import 'package:dzr_site/components/components.dart';

//TODO Finish style fixes
//TODO mobile friendly
//TODO setup email trigger for new leads https://console.firebase.google.com/u/0/project/dzr-site/extensions/instances/firestore-send-email?tab=config
//TODO                                   https://firebase.google.com/docs/extensions/official/firestore-send-email
//TODO                                   https://stackoverflow.com/questions/65537786/firebase-trigger-email-and-smtp-connection-uri-using-gmail

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Your Public Adjuster',
        // theme: ThemeData(primaryColor: Colors.white),
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
              ),
          "/admindev": (context) => const AdminDash(),
        });
  }
}
