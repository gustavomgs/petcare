import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget raised({
  Function ontap,
  Widget child,
}) {
  return SizedBox(
    height: 44,
    child: RaisedButton(
      disabledColor: Colors.blue.withOpacity(0.5),
      onPressed: ontap,
      child: child,
      color: Colors.blue[900],
    ),
  );
}

Widget myflat({
  Function ontap,
  String title,
  Color colorText,
}) {
  return FlatButton(
      onPressed: ontap,
      child: Text(
        title,
        style: TextStyle(
          color: colorText = Colors.blue[900],
        ),
      ));
}

Widget forgotButton() {
  return Align(
    alignment: Alignment.centerRight,
    child: FlatButton(
      padding: EdgeInsets.zero,
      onPressed: null,
      child: const Text('Esqueci minha Senha'),
    ),
  );
}
