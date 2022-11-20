import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final String name;
  final Widget body;
  const Header({super.key, required this.name, required this.body});

  static const List<String> actionStrings = [
    'home',
    'residential',
    'commercial',
    'contact'
  ];

  //TODO V2 PageRouter(name: 'results'),
  static List<PageRouter> actions = actionStrings
      .map<PageRouter>((string) => PageRouter(name: string))
      .toList();

  static List<DropdownMenuItem<String>> dropdownActions = actionStrings
      .map<DropdownMenuItem<String>>((string) => DropdownMenuItem<String>(
          value: string, child: PageRouter(key: Key(string), name: string)))
      .toList();

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Logo(),
          leadingWidth: 200,
          actions: screenSize.height > screenSize.width
              ? [
                  DropdownButton(
                      value: widget.name,
                      items: Header.dropdownActions,
                      dropdownColor: Colors.transparent,
                      icon: const Icon(Icons.more_vert_sharp),
                      onChanged: (_) => null)
                ]
              : Header.actions,
        ),
        body: SingleChildScrollView(child: widget.body));
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
        onPressed: () =>
            Navigator.of(context).pushNamed('/${name.replaceAll(" ", "")}'),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            name.padRight(10),
            maxLines: 1,
            style: headerStyle,
          ),
        ),
      ),
    );
  }
}
