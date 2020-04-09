import 'package:flutter/material.dart';

void main() => runApp(MyBankApp());

class MyBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue[900],
          accentColor: Colors.blue[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: Dashboard());
  }
}

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
            child: Container(
              padding: EdgeInsets.all(16),
              height: 100,
              width: 100,
              color: Theme.of(context).primaryColor,
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
        ],
      ),
    );
  }
}
