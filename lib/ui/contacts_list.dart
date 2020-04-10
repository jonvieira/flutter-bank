import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bank/ui/contact_form.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Jonas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Software Engineer',
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToAddNewContact(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void goToAddNewContact(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ContactForm()))
        .then((newContact) => debugPrint(newContact.toString()));
  }
}
