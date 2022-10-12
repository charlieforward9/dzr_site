import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:dzr_site/views/admin/admin_dash.dart';

class AdminView extends StatelessWidget {
  AdminView({Key? key}) : super(key: key);

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

//TODO auth persistence
  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providerConfigs: const [
        EmailProviderConfiguration(),
      ],
      showAuthActionSwitch: false,
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (context) => const AdminDash(),
          ));
        }),
      ],
    );
  }
}
