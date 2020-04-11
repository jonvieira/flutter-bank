import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bank/model/contact_model.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New contact')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Full name'),
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: _accountController,
                decoration: InputDecoration(labelText: 'Account number'),
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Add contact'),
                  onPressed: () {
                    goToContactList(
                        _nameController.text, _accountController.text);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void goToContactList(String name, String account) {
    final Contact newContact = Contact(name, account);
    Navigator.pop(context, newContact);
  }
}
