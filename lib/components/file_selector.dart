import 'package:dzr_site/bloc/firebase_bloc.dart';
import 'package:dzr_site/styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileSelector extends StatefulWidget {
  final String path;
  final FirebaseBloc bloc;

  const FileSelector({super.key, required this.path, required this.bloc});

  @override
  State<FileSelector> createState() => _FileSelectorState();
}

class _FileSelectorState extends State<FileSelector> {
  PlatformFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        height: screenSize(context).height / 3,
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
                          onPressed: () async {
                            final result = await selectFile();
                            result != null
                                ? setState(() => pickedFile = result)
                                : null;
                          },
                          style: headerButtonStyle,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text("Select File",
                                style: smallActionStyle, maxLines: 1),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            pickedFile != null
                                ? widget.bloc.add(FirebaseAdd(
                                    path: widget.path, file: pickedFile!))
                                : null;
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('File Uploaded')),
                            );
                          },
                          style: headerButtonStyle,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text("Upload File",
                                style: smallActionStyle, maxLines: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<PlatformFile?> selectFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);
    if (result != null) {
      return result.files.first;
    }
    return null;
  }
}
