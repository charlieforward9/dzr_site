import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void configFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
