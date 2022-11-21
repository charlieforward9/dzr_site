import 'package:dzr_site/components/file_dialog.dart';
import 'package:dzr_site/firebase.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'firebase_state.dart';

class FirebaseCubit extends Cubit<FirebaseState> {
  FirebaseCubit() : super(FirebaseLoading());

  final List<FirebaseImage> data = [];

  Future getContent(String path) async {
    try {
      await cloudOps.getImages(path).then((ref) async {
        await Future.wait(
          ref.map((item) async {
            final url = await item.getData();
            FirebaseImage fbImg =
                FirebaseImage(ref: item, img: Image.memory(url!));
            data.add(fbImg);
          }).toList(),
        );
      });
      if (data.isNotEmpty) {
        emit(FirebaseLoaded(firebaseImages: data));
      } else {
        emit(FirebaseError(Exception("No images to display")));
      }
    } catch (e) {
      emit(FirebaseError(e));
    }
  }
}

Future<String?> addContentPopup(BuildContext context, String path) {
  //Select 2 files in results page (before/after), other pages select 1 at a time

  return showDialog<String>(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) => FileDialog(path: path));
}

Future<PlatformFile?> selectFile() async {
  FilePickerResult? result = await FilePicker.platform
      .pickFiles(type: FileType.image, allowMultiple: false);
  if (result != null) {
    return result.files.first;
  }
  return null;
}

Future uploadFile(String path, PlatformFile file) async {
  try {
    final task = await FirebaseStorage.instance
        .ref('images/$path/${DateTime.now().toIso8601String()};${file.name}')
        .putData(
          file.bytes!,
          SettableMetadata(contentType: 'images/${file.extension}'),
        );

    return task;
  } catch (e) {
    print('error in uploading image for : ${e.toString()}');
    return '';
  }
}
