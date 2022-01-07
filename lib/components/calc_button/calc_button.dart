import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Calcular'),
      onPressed: () {
        // print('FUNCIONA');
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.blue[600],
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          textStyle:
              const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }
}
