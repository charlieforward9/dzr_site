import 'package:dzr_site/bloc/firebase_bloc.dart';
import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommercialView extends StatelessWidget {
  const CommercialView({super.key});
  final String path = "misc/commercial";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          BlocProvider(
            create: (context) => FirebaseBloc()..add(FirebaseFetch(path: path)),
            child: BlocBuilder<FirebaseBloc, FirebaseState>(
              builder: (context, state) {
                if (state is FirebaseLoaded) {
                  return SizedBox(
                    height:  screenSize(context).height / 2,
                    width:  screenSize(context).width,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                            top:  screenSize(context).height * -1.5,
                            child: state.firebaseImages[0].img!),
                        Positioned(
                          top:  screenSize(context).height / 4,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: screenSize(context).width / 2,
                                maxWidth: screenSize(context).width),
                            child: Container(
                              decoration: titleBox,
                              child: Text(
                                "OUR BUSINESS\n FOR YOUR BUSINESS",
                                style: titleStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is FirebaseError) {
                  return Text(state.error.toString());
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 300,
              maxHeight: 750,
              minWidth: screenSize(context).width * 0.8,
              maxWidth: screenSize(context).width * 0.9,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 80,
                    maxHeight: 200,
                  ),
                  child: Text(
                      "Handling insurance claims come at a high opportunity cost.",
                      style: subTitleStyle,
                      textAlign: TextAlign.center),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 100,
                    maxHeight: 300,
                  ),
                  child: Text(
                      "For commerial property owner suffering damage resulting in a covered insurance claim, mandatory insurance policy conditions are required to be completed timely or your coverage may be severely limited or even denied.",
                      style: paragraphStyle),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 100,
                    maxHeight: 200,
                  ),
                  child: Text(
                      "Meetings and inventory documentation requirements take precious time away from work obligations. Let us navigate your claim process on your behalf, so you can focus on expediting your business recovery.",
                      style: paragraphStyle),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 100,
                    maxHeight: 120,
                  ),
                  child: Text(
                      "Call me today and learn more about FREE claim and policy reviews.",
                      style: subTitleStyle,
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
          const ClaimsProcess(),
          const Footer()
        ],
      ),
    );
  }
}
