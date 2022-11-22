import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dzr_site/bloc/firebase_bloc.dart';

class AdminServices extends StatefulWidget {
  const AdminServices({super.key});
  static const path1 = "services/residential";
  static const path2 = "services/commercial";

  @override
  State<AdminServices> createState() => _AdminServicesState();
}

class _AdminServicesState extends State<AdminServices> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            children: [
              Text("Residential Landing Photo", style: headerStyle),
              BlocProvider(
                create: (context) => FirebaseBloc()
                  ..add(FirebaseFetch(path: AdminServices.path1)),
                child: BlocBuilder<FirebaseBloc, FirebaseState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
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
                            return Text(state.error.toString());
                          }
                        }()),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: FloatingActionButton(
                            child: const Icon(Icons.add),
                            onPressed: () =>
                                BlocProvider.of<FirebaseBloc>(context)
                                    .addContent(context, AdminServices.path1),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            children: [
              Text("Commerical Landing Photo", style: headerStyle),
              BlocProvider(
                create: (context) => FirebaseBloc()
                  ..add(FirebaseFetch(path: AdminServices.path2)),
                child: BlocBuilder<FirebaseBloc, FirebaseState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
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
                            return Text(state.error.toString());
                          }
                        }()),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: FloatingActionButton(
                            child: const Icon(Icons.add),
                            onPressed: () =>
                                BlocProvider.of<FirebaseBloc>(context)
                                    .addContent(context, AdminServices.path2),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
