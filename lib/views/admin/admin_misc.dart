import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dzr_site/bloc/firebase_bloc.dart';
import 'package:seo_renderer/seo_renderer.dart';

class AdminMisc extends StatefulWidget {
  const AdminMisc({super.key});

  @override
  State<AdminMisc> createState() => _AdminMiscState();
}

class _AdminMiscState extends State<AdminMisc> {
  final path1 = "misc/residential";
  final path2 = "misc/commercial";
  final path3 = "misc/contact";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          contentEntryBloc("Residential Landing Photo (1 only)", path1),
          contentEntryBloc("Commerical Landing Photo (1 only)", path2),
          contentEntryBloc("Contact Landing Photo (1 only)", path3)
        ],
      ),
    );
  }

//TODO if there is an image, do not show the plus sign
  Widget contentEntryBloc(String text, String path) => SizedBox(
        width: screenSize(context).width / 2,
        child: Column(
          children: [
            TextRenderer(child: Text(text, style: headerStyle)),
            BlocProvider(
              create: (context) =>
                  FirebaseBloc()..add(FirebaseFetch(path: path)),
              child: BlocBuilder<FirebaseBloc, FirebaseState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: screenSize(context).height * 0.3,
                      ),
                      Center(child: () {
                        if (state is FirebaseLoading) {
                          return const CircularProgressIndicator();
                        }
                        if (state is FirebaseLoaded) {
                          return BlocProvider.of<FirebaseBloc>(context)
                              .showContent(context);
                        }
                        if (state is FirebaseError) {
                          return TextRenderer(
                              child: Text(state.error.toString()));
                        }
                      }()),
                      Positioned(
                        left: 10,
                        child: FloatingActionButton(
                          child: const Icon(Icons.add),
                          onPressed: () =>
                              BlocProvider.of<FirebaseBloc>(context)
                                  .addContent(context, path),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
}
