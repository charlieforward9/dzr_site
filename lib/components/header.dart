import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget body;
  const Header({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Logo(),
          leadingWidth: MediaQuery.of(context).size.width / 6,
          actions: const [
            //TODO V2 PageRouter(name: 'results'),
            PageRouter(name: 'residential'),
            PageRouter(name: 'commercial'),
            PageRouter(name: 'contact'),
          ],
        ),
        body: SingleChildScrollView(child: body));
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.of(context).pushNamed('/'),
        child: const Image(image: AssetImage("logo.png")));
  }
}

class PageRouter extends StatelessWidget {
  final String name;
  const PageRouter({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () => Navigator.of(context).pushNamed('/$name'),
        child: Text(
          name,
          style: headerStyle,
        ),
      ),
    );
  }
}
