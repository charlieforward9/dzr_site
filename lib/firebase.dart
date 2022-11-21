// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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
  Future<List<Reference>> getImages(String path) async {
    return await FirebaseStorage.instance
        .ref('images/$path')
        .listAll()
        .then((results) => results.items);
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

@immutable
class FirebaseImage {
  final Reference? ref;
  final Image? img;

  const FirebaseImage({required this.ref, required this.img});
}
