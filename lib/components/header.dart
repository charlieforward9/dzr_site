import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget body;
  const Header({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Logo(),
          leadingWidth: MediaQuery.of(context).size.width / 6,
          actions: const [
            PageRouter(name: 'results'),
            PageRouter(name: 'residential'),
            PageRouter(name: 'commercial'),
            PageRouter(name: 'contact')
          ],
        ),
        body: body);
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.of(context).popAndPushNamed('/'),
        child: const Image(image: AssetImage("logo.png")));
  }
}

class PageRouter extends StatelessWidget {
  final String name;
  const PageRouter({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).pushNamed('/$name'),
      child: Text(name),
    );
  }
}
