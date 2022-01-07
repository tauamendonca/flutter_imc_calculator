import 'package:flutter/material.dart';
import 'package:imc/components/calculator/imc_calculator_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cálculo de IMC',
      home: ImcCalculator(),
    );
  }
}
