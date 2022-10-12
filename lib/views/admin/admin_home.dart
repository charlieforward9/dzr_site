import 'package:dzr_site/firebase.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final path = "home";
  late List<String> imageURLs;

  @override
  initState() {
    super.initState;
    _getContent();
  }

  _getContent() async {
    final urls = await FirebaseOps().getImageURLs(path);
    setState(() {
      imageURLs = urls;
    });
  }

  @override
    //TODO Implement
  Widget build(BuildContext context) {
    return imageURLs.isNotEmpty
        ? ListView.builder(
            itemCount: imageURLs.length,
            prototypeItem: ListTile(title: Image.network(imageURLs.first)),
            itemBuilder: (context, index) {
              return ListTile(title: Image.network(imageURLs[index]));
            })
        : const Text("No images exist yet");
  }
}
