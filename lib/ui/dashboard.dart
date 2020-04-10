import 'package:flutter/material.dart';
import 'package:flutter_bank/core/navigationController.dart';
import 'package:flutter_bank/ui/contacts_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Bank")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset("images/flutter-bank-logo.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () {
                  navigationTo(context, ContactsList());
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.people, color: Colors.white, size: 32),
                      Text(
                        'Contacts',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
