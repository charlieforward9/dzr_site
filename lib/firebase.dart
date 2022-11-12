// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';

CloudOps cloudOps = CloudOps();

class CloudOps {
  late FirebaseFirestore firestore;
  late FirebaseStorage storage;

  Future<void> configFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    firestore = FirebaseFirestore.instance;
    storage = FirebaseStorage.instance;
  }

//TODO this needs to be fixed to return future images one by one and not finish until they are all finished
  Future<List<Uint8List>> getImagesData(String folder) async {
    final List<Uint8List> images = [];
    final storageRef = storage.ref().child(folder);
    final imageRef =
        await storageRef.listAll().then((ListResult result) => result.items);
    imageRef.sort(((a, b) => a.name.compareTo(b.name)));
    imageRef.forEach((image) async {
      log(image.name);
      await image.getData().then((data) => images.add(data!));
    });

    return images;
  }

  Future<List<String>> getImageDescriptionData(String folder) async {
    List<String> descriptions = [];
    await firestore.collection(folder).orderBy("id").get().then(
      (res) {
        res.docs.forEach((element) {
          String description = element.data()["Description"];
          log(description);
          descriptions.add(description);
        });
      },
      onError: (e) => log("Error completing: $e"),
    );
    return descriptions;
  }
}
