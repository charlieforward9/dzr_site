import 'package:dzr_site/firebase.dart';
import 'package:dzr_site/styles.dart';
import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> leadData = {};

  void _configEmail() {
    leadData["to"] = "drobinson@claimpros.com";
    leadData["message"] = {
      "subject": "New Claims Lead: ${leadData["Name"]}",
      "text":
          "A lead submitted a contact through the website \n * Lead Name: ${leadData["Name"]} \n * Email: ${leadData["Email"]} \n * Phone: ${leadData["Phone"]} \n * Zip: ${leadData["Zip"]} \n * Details: ${leadData["Details"]}"
    };
  }

  void _storeContact() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _configEmail();
      cloudOps.firestore.collection("leads").add(leadData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextRenderer(
              child:
                  Text('Thank you, expect to be contacted by our team soon!')),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: screenSize(context).width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _formInput("Name"),
              const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
              _formInput("Email"),
              const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
              _formInput("Phone"),
              const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
              _formInput("Zip Code"),
              const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
              _formInput("Details", lines: 3),
              const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
              ElevatedButton(
                style: actionButtonStyle,
                onPressed: _storeContact,
                child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: TextRenderer(
                        child: Text('Submit', style: actionStyle))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formInput(String field, {int lines = 1}) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: 45.0 * lines,
          minWidth: screenSize(context).width / 2,
          maxWidth: screenSize(context).width),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: actionColor.withOpacity(0.5), width: 5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child:
                  TextRenderer(child: Text(" $field:", style: paragraphStyle)),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: screenSize(context).width / 2,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
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
            ),
          ],
        ),
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
