import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget raised({
  Function ontap,
}) {
  return SizedBox(
    height: 44,
    child: RaisedButton(
      onPressed: ontap,
      child: Text(
        'Entrar',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue[900],
    ),
  );
}


