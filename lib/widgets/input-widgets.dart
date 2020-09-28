import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypetcare/helpers/validators.dart';

Widget fildLogin({
  TextEditingController controller,
  String hint = '',
  TextInputType inputType,
  bool obscure = false,
  Function iconButton,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
    ),
    autocorrect: false,
    keyboardType: inputType,
    obscureText: obscure,
    validator: (val) {
      if (val.isEmpty) {
        return 'Senha inválida';
      }
    },
  );
}

Widget fildEmail({
  TextEditingController controller,
  String hint = '',
  TextInputType inputType,
  bool obscure = false,
  Function validator,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
    ),
    autocorrect: false,
    keyboardType: inputType,
    obscureText: obscure,
    validator: (email) {
      if (!validaEmail(email)) {
        return 'Email inválido';
      }
    },
  );
}
