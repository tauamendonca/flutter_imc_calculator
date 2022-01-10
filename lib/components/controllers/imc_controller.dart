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
      textStart = "Seu IMC é $result";
      notifyListeners();
    } catch (e) {
      textStart = "Tem certeza que são esses seu peso e altura?";
      notifyListeners();
      //throw ("Ocorreu um erro: $e");
    }
  }
}
