import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';

class FirebaseOps {
  late FirebaseFirestore firestore;
  late FirebaseStorage storage;

  Future<void> configFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    firestore = FirebaseFirestore.instance;
    storage = FirebaseStorage.instance;
  }

  Future<List<String>> getImageURLs(String folder) async {
    final storageRef = storage.ref().child("images/$folder");
    final imageRef =
        await storageRef.listAll().then((ListResult result) => result.items);
    final List<String> images = [];
    for (var image in imageRef) {
      await image.getDownloadURL().then((url) => images.add(url));
    }
    return images;
  }
}
