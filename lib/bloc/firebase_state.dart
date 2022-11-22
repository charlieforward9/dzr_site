part of 'firebase_bloc.dart';

@immutable
abstract class FirebaseState {}

class FirebaseLoading extends FirebaseState {}

class FirebaseLoaded extends FirebaseState {
  final List<FirebaseImage> firebaseImages;
  FirebaseLoaded({required this.firebaseImages});
}

class FirebaseError extends FirebaseState {
  final Object error;
  FirebaseError(this.error);
}
