import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loginBar({
  String title = 'Login',
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
    centerTitle: true,
  );
}

Widget myappBar({
  Color colorBar,
  String title,
}) {
  return AppBar(
    backgroundColor: colorBar,
    title: Text(title),
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