///TO CALL flutterfire configure,
///export PATH="$PATH":"$HOME/.pub-cache/bin"
import 'package:flutter/material.dart';

import 'firebase.dart';
import 'views/views.dart';
import 'components/header.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseOps().configFirebase();
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
        //theme: ,
        routes: {
          "/": (context) => const Header(body: HomeView()),
          "/results": (context) => const Header(body: ResultsView()),
          "/residential": (context) => const Header(body: ResidentialView()),
          "/commercial": (context) => const Header(body: CommercialView()),
          "/contact": (context) => const Header(body: ContactView()),
          "/admin": (context) => Header(body: AdminView()),
        });
  }
}
