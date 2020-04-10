import 'package:flutter/material.dart';

void navigationTo(BuildContext origin, destination) {
  Navigator.of(origin).push(
    MaterialPageRoute(builder: (context) => destination),
  );
}
