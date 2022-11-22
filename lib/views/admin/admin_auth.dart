import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:dzr_site/views/admin/admin_dash.dart';

class AdminView extends StatelessWidget {
  AdminView({Key? key}) : super(key: key);

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //child: const AdminDash()
      child: SignInScreen(
        sideBuilder: ((context, constraints) =>
            const Image(image: AssetImage('logo.png'))),
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
      ),
    );
  }
}
