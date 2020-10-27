import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petcare/helpers/validators.dart';

Widget fildLogin({
  TextEditingController controller,
  String hint = '',
  TextInputType inputType,
  bool obscure = false,
  Function iconButton,
  bool enable = true,
}) {
  return TextFormField(
    enabled: enable,
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
  bool enable,
}) {
  return TextFormField(
    enabled: enable = true,
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

Widget name({Function onsaved}) {
  return TextFormField(
      decoration: InputDecoration(hintText: 'Nome completo'),
      validator: (name) {
        if (name.isEmpty)
          return 'campo obrigatório';
        else if (name.trim().split('').length <= 1)
          return 'Preencha seu nome completo';
      },
      onSaved: onsaved);
}

Widget email({
  Function onsaved,
}) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(hintText: 'E-mail'),
    obscureText: false,
    validator: (email) {
      if (email.isEmpty)
        return 'campo obrigatorio';
      else if (!validaEmail(email)) return 'e-mail inválido';
    },
    onSaved: onsaved,
  );
}

Widget senha({
  Function onsaved,
}) {
  return TextFormField(
    decoration: InputDecoration(hintText: 'Senha'),
    obscureText: true,
    validator: (senha) {
      if (senha.isEmpty)
        return 'campo obrigatorio';
      else if (senha.length < 6) return 'senha muito curta';
    },
    onSaved: onsaved,
  );
}

Widget conFirm({
  Function onsaved,
}) {
  return TextFormField(
    decoration: InputDecoration(hintText: 'Repita a senha'),
    obscureText: true,
    validator: (senha) {
      if (senha.isEmpty)
        return 'campo obrigatorio';
      else if (senha.length < 6) return 'senha muito curta';
    },
    onSaved: onsaved,
  );
}
