part of 'firebase_bloc.dart';

@immutable
abstract class FirebaseEvent {}

class FirebaseFetch extends FirebaseEvent {
  final String path;
  FirebaseFetch({required this.path});
}

class FirebaseAdd extends FirebaseEvent {
  final String path;
  final PlatformFile file;
  FirebaseAdd({required this.path, required this.file});
}

class FirebaseDelete extends FirebaseEvent {
  final int index;
  FirebaseDelete({required this.index});
}
