part of 'firebase_cubit.dart';

@immutable
abstract class FirebaseState {}

class FirebaseLoading extends FirebaseState {}

class FirebaseLoaded extends FirebaseState {
  //Photos data type goes here
  final List<FirebaseImage> firebaseImages;
  FirebaseLoaded({required this.firebaseImages});
}

class FirebaseError extends FirebaseState {
  Object error;
  FirebaseError(this.error);
}
