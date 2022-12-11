import 'package:dzr_site/bloc/firebase_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seo_renderer/seo_renderer.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});
  static const String path = "home";

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FirebaseBloc()..add(FirebaseFetch(path: AdminHome.path)),
      child: BlocBuilder<FirebaseBloc, FirebaseState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              () {
                if (state is FirebaseLoaded) {
                  return BlocProvider.of<FirebaseBloc>(context)
                      .showContent(context);
                }
                if (state is FirebaseError) {
                  return TextRenderer(child: Text(state.error.toString()));
                } else {
                  return const CircularProgressIndicator();
                }
              }(),
              Positioned(
                bottom: 10,
                right: 10,
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () => BlocProvider.of<FirebaseBloc>(context)
                      .addContent(context, AdminHome.path),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
