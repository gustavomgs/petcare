import 'package:flutter/material.dart';

class FeedCalculator extends StatefulWidget {
  @override
  _FeedCalculatorState createState() => _FeedCalculatorState();
}

class _FeedCalculatorState extends State<FeedCalculator> {
  String racao = "";

  double peso = 0, percent, total;

  String porte;

  TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora de Ração")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [Icon(Icons.account_balance)],
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Peso do Cão(Kg)",
              ),
              controller: _weightController,
            ),
            SizedBox(
              height: 50,
            ),
            buildTextResult(),
            Text(
              racao,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
                child: Text("Calcular"),
                textColor: Colors.white,
                color: Colors.blue[800],
                onPressed: () {
                  peso = double.parse(_weightController.text);
                  setState(() {
                    getPorte();
                    calcularRacao();
                  });
                }),
          ],
        ),
      ),
    );
  }

  Widget buildTextResult() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            getPorte(),
            textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.5),
          ),
        ],
      ),
    );
  }

  String getPorte() {
    if (peso == 0) {
      return "Insira o peso";
    } else if (peso < 3) {
      percent = peso * 0.07;
      return porte = "Porte Miniatura I";
    } else if (peso < 5) {
      percent = peso * 0.06;
      return porte = "Porte Miniatura II";
    } else if (peso < 10) {
      percent = peso * 0.05;
      return porte = "Porte Pequeno";
    } else if (peso < 22) {
      percent = peso * 0.05;
      return porte = "Porte Médio";
    } else if (peso < 40) {
      percent = peso * 0.045;
      return porte = "Porte Grande";
    } else {
      percent = peso * 0.04;
      return porte = "Porte Gigante";
    }
  }

  void calcularRacao() {
    total = (peso * percent) * 100;
    racao = total.toStringAsFixed(0) + "g de ração por dia";
  }
}
