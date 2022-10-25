import 'package:dzr_site/firebase.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> leadData = {};

  void _storeContact() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      cloudOps.firestore.collection("leads").add(leadData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _formInput("Name"),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16)),
                      _formInput("Email"),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 32)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _formInput("Phone"),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16)),
                      _formInput("Zip Code"),
                    ],
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  _formInput("Details", lines: 3),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: _storeContact,
                      child: SizedBox(
                          height: 72,
                          width: 144,
                          child: Center(
                              child: Text('Submit', style: actionStyle))),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formInput(String field, {int lines = 1}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(),
        borderRadius: BorderRadius.circular(1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(" $field:", style: paragraphStyle),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: TextFormField(
              maxLines: lines,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter your information'
                  : null,
              onSaved: (String? value) {
                _storeValue(field, value);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _storeValue(String field, String? value) {
    field == "Name" ||
            field == "Email" ||
            field == "Phone" ||
            field == "Zip Code" ||
            field == "Details"
        ? leadData[field] = value!
        : throw Exception("Invalid field or value used");
  }
}
