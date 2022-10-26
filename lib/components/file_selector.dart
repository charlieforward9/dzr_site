import 'dart:io';

import 'package:dzr_site/styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FileSelector extends StatefulWidget {
  const FileSelector({super.key});

  @override
  State<FileSelector> createState() => _FileSelectorState();
}

class _FileSelectorState extends State<FileSelector> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);
    if (result != null) {
      setState(() {
        pickedFile = result.files.first;
      });
    }
  }

  Future uploadFile(String path) async {
    final file = File.fromRawPath(pickedFile!.bytes!);

    final ref = FirebaseStorage.instance.ref().child("/images/$path");
    setState(() {
      uploadTask = ref.putFile(file);
    });

    // To get urlDownload as soon as its available
    // final snapshot = await uploadTask!.whenComplete(() {});
    // final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      uploadTask = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Align(
          child: AspectRatio(
            aspectRatio: 16 / 12,
            child: Align(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 11,
                    child: Container(
                      color: Colors.blue[100],
                      child: pickedFile != null
                          ? Image.memory(pickedFile!.bytes!, fit: BoxFit.cover)
                          : const Text("No image selected"),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: selectFile,
                          style: buttonStyle,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text("Select File",
                                style: smallActionStyle, maxLines: 1),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => pickedFile != null
                              ? uploadFile("home")
                              : selectFile,
                          style: buttonStyle,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text("Upload File",
                                style: smallActionStyle, maxLines: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  buildProgress()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;
          return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text('${(100 * progress).roundToDouble()}%'),
                  )
                ],
              ));
        } else {
          return const SizedBox(height: 0);
        }
      });
}
