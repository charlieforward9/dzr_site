import 'package:dzr_site/bloc/firebase_bloc.dart';
import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});
  final path = "misc/contact";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1000,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              BlocProvider(
                create: (context) =>
                    FirebaseBloc()..add(FirebaseFetch(path: path)),
                child: BlocBuilder<FirebaseBloc, FirebaseState>(
                  builder: (context, state) {
                    if (state is FirebaseLoaded) {
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                              top: screenSize(context).height / -1,
                              child: state.firebaseImages[0].img!),
                          Positioned(
                            top: screenSize(context).height / 5,
                            child: Container(
                              decoration: titleBox,
                              child: Text("CONTACT US",
                                  style: titleStyle,
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      );
                    } else if (state is FirebaseError) {
                      return Text(state.error.toString());
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              Positioned(
                top: screenSize(context).height / 3,
                child: const ContactForm(),
              ),
            ],
          ),
        ),
        const Footer()
      ],
    );
  }
}
