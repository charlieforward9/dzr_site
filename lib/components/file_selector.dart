import 'dart:io';

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
    return Center(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 9 / 19.5,
            child: pickedFile != null
                ? Container(
                    color: Colors.blue[100],
                    child: Image.memory(pickedFile!.bytes!, fit: BoxFit.cover))
                : null,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
              onPressed: selectFile, child: const Text("Select File")),
          const SizedBox(height: 32),
          ElevatedButton(
              onPressed: () => uploadFile("home"),
              child: const Text("Upload File")),
          buildProgress(),
        ],
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
          return const SizedBox(height: 50);
        }
      });
}
