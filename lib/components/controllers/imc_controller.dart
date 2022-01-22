import 'package:flutter/material.dart';

class ImcController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  var textStart = "Digite abaixo seu peso e altura para calcular seu IMC";

  var _peso = 0.0;
  var _altura = 0.0;

  void onChange({peso, altura}) {
    _peso = peso ?? _peso;
    _altura = altura ?? _altura;
  }

  // bool validate() {
  //   final form = formKey.currentState!;
  //   if (form.validate()) {
  //     form.save();
  //     return true;
  //   }
  //   return false;
  // }

  void calculateImc() {
    try {
      final result = _peso / (_altura * _altura);
      final imcPrint = classificateImc(result);
      textStart = "Seu IMC é ${result.toStringAsFixed(0)} $imcPrint";

      notifyListeners();
    } catch (e) {
      textStart =
          "Houve um erro no cálculo. Entre em contato com o desenvolvedor.";
      notifyListeners();
      //throw ("Ocorreu um erro: $e");
    }
  }
}

classificateImc(imc) {
  String imcClass = "";

  if (imc < 18.5) {
    imcClass = "abaixo do peso";
  } else if (imc >= 18.5 && imc <= 24.9) {
    imcClass = "com peso normal";
  } else if (imc >= 25 && imc <= 29.9) {
    imcClass = "com obesidade de grau I";
  } else if (imc >= 30 && imc <= 34.9) {
    imcClass = "com obesidade de grau II";
  } else {
    imcClass = "com obesidade de grau III ou mórbida";
  }

  return "e você está $imcClass";
}
