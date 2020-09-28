import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loginBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      'Login',
      style: TextStyle(color: Colors.black),
    ),
    centerTitle: true,
  );
}

Widget myappBar({
  Color colorBar,
  Text title,
}) {
  return AppBar(
    backgroundColor: colorBar,
    title: title,
    actions: [
      IconButton(
          icon: Icon(
            Icons.notification_important,
            color: Colors.redAccent,
          ),
          onPressed: null),
      IconButton(
          icon: Icon(
            Icons.pets,
            color: Colors.white,
          ),
          onPressed: null)
    ],
  );
}
