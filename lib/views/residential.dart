import 'package:dzr_site/bloc/firebase_bloc.dart';
import 'package:dzr_site/components/components.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seo_renderer/seo_renderer.dart';

class ResidentialView extends StatelessWidget {
  const ResidentialView({super.key});
  final String path = "misc/residential";

  static const Set<String> services = {
    "Bid comparison and analysis",
    "Separation of damaged from undamaged goods",
    "Itemized contents inventory",
    "Valuation for replacement and actual cash values",
    "Determination of sales tax and acquisition time to replace total loss items",
    "Preparation of additional living expense (“ALE”) expenses, co-insurance calculations",
    "Preparation and filing of proof of loss forms."
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (context) => FirebaseBloc()..add(FirebaseFetch(path: path)),
          child: BlocBuilder<FirebaseBloc, FirebaseState>(
            builder: (context, state) {
              if (state is FirebaseLoaded) {
                return SizedBox(
                  height: screenSize(context).height / 2,
                  width: screenSize(context).width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          top: screenSize(context).height / -2,
                          child: state.firebaseImages[0].img!),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Container(
                          decoration: titleBox,
                          child: TextRenderer(
                            child: Text("IT'S NOT A HOUSE\nIT'S YOUR HOME",
                                style: titleStyle, textAlign: TextAlign.center),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is FirebaseError) {
                return TextRenderer(child: Text(state.error.toString()));
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 400,
            maxHeight: 1300,
            minWidth: screenSize(context).width * 0.8,
            maxWidth: screenSize(context).width * 0.95,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 80,
                  maxHeight: 200,
                ),
                child: TextRenderer(
                  child: Text(
                      "Insurance claims can be a very confusing, emotional, and stressful process.",
                      style: subTitleStyle,
                      textAlign: TextAlign.center),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  maxHeight: 400,
                ),
                child: TextRenderer(
                  child: Text(
                      "When a residential property owner suffers damage resulting in a covered insurance claim, mandatory insurance policy conditions are required to be completed timely or your coverage may be severely limited or even denied.",
                      style: paragraphStyle),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  maxHeight: 400,
                ),
                child: TextRenderer(
                  child: Text(
                      "Depending on the complexity of the claim, the policyholder may need to secure temporary housing, I document, prepare, and present these out of pocket expenses to make sure your reimbursement is expedited.",
                      style: paragraphStyle),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  maxHeight: 400,
                ),
                child: TextRenderer(
                  child: Text(
                      "It can be difficult to quantify depreciation, distinguishing the appropriateness of replacement versus repair costs, and preparing reimbursement for additional living expenses.",
                      style: paragraphStyle),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 100,
                  maxHeight: 200,
                ),
                child: TextRenderer(
                  child: Text(
                      "Call me today and learn more about FREE claim and policy reviews.",
                      style: subTitleStyle,
                      textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
        const ClaimsProcess(),
        const Footer()
      ],
    );
  }
}
