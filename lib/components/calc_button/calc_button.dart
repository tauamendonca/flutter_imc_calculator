import 'package:flutter/material.dart';
import 'package:imc/components/controllers/imc_controller.dart';

class CalcButton extends StatefulWidget {
  final ImcController controller;
  const CalcButton({Key? key, required this.controller}) : super(key: key);

  @override
  State<CalcButton> createState() => _CalcButtonState();
}

class _CalcButtonState extends State<CalcButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Calcular'),
      onPressed: () {
        widget.controller.calculateImc();
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.blue[600],
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          textStyle:
              const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }
}
