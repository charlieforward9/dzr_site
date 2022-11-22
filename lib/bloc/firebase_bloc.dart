import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dzr_site/firebase.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  late List<FirebaseImage> data;

  FirebaseBloc() : super(FirebaseLoading()) {
    on<FirebaseFetch>(_fetchData);
    on<FirebaseAdd>(_addData);
    on<FirebaseDelete>(_deleteData);
  }

  void _fetchData(FirebaseFetch event, Emitter<FirebaseState> emit) async {
    data = [];
    try {
      await cloudOps.getImages(event.path).then((ref) async {
        await Future.wait(
          ref.map((item) async {
            final url = await item.getData();
            FirebaseImage fbImg =
                FirebaseImage(ref: item, img: Image.memory(url!));
            data.add(fbImg);
          }).toList(),
        );
      });
      data.isNotEmpty
          ? emit(FirebaseLoaded(firebaseImages: data))
          : emit(FirebaseError(Exception("No images to display")));
    } catch (e) {
      emit(FirebaseError(e));
    }
  }

  void _addData(FirebaseAdd event, Emitter<FirebaseState> emit) async {
    try {
      await FirebaseStorage.instance
          .ref(
              'images/${event.path}/${DateTime.now().toIso8601String()};${event.file.name}')
          .putData(
            event.file.bytes!,
            SettableMetadata(contentType: 'images/${event.file.extension}'),
          );
      data = [];
      add(FirebaseFetch(path: event.path));
    } catch (e) {
      emit(FirebaseError('error in uploading image for : ${e.toString()}'));
    }
  }

  void _deleteData(FirebaseDelete event, Emitter<FirebaseState> emit) {
    emit(FirebaseLoading());
    data[event.index].ref!.delete();
    data.removeAt(event.index);
    emit(FirebaseLoaded(firebaseImages: data));
  }

  Widget showContent(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < screenSize.height;
    return SingleChildScrollView(
        child: SizedBox(
            height: screenSize.height * 0.8,
            width: screenSize.width,
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        key: ValueKey(index),
                        children: [
                          SizedBox(
                            height: screenSize.width * 0.25,
                            width: screenSize.width * 0.4,
                            child: ListTile(title: data[index].img),
                          ),
                          IconButton(
                              icon: const Icon(Icons.delete_forever),
                              onPressed: () {
                                add(FirebaseDelete(index: index));
                              })
                        ]))));
  }

  Future<String?> addContent(BuildContext context, String path) {
    return showDialog<String>(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.only(bottom: 56.0),
              child: Dialog(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: const BoxDecoration(color: primaryColor),
                  child: FileSelector(bloc: this, path: path),
                ),
              ),
            ));
  }
}
