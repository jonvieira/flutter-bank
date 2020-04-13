import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bank/database/app_database.dart';
import 'package:flutter_bank/model/contact_model.dart';
import 'package:flutter_bank/ui/contact_form.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 2)).then((value) => findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return showLoading();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return showContactList(snapshot);
              break;
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToAddNewContact(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Center showLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Text('Carregando'),
        ],
      ),
    );
  }

  ListView showContactList(AsyncSnapshot<List<Contact>> snapshot) {
    final List<Contact> listContacts = snapshot.data;
    return ListView.builder(
      itemBuilder: (context, index) {
        final Contact contact = listContacts[index];
        return ContactsCardItem(contact);
      },
      itemCount: listContacts.length,
    );
  }

  void goToAddNewContact(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ContactForm()))
        .then((newContact) => debugPrint(newContact.toString()));
  }
}

class ContactsCardItem extends StatelessWidget {
  final Contact contact;

  ContactsCardItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          contact.account.toString(),
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
