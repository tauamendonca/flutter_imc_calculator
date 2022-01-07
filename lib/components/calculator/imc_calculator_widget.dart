import 'package:flutter/material.dart';
import 'package:imc/widgets/calc_button.dart';
import 'package:imc/widgets/input_text.dart';

//Definição da classe Form
class ImcCalculator extends StatefulWidget {
  const ImcCalculator({Key? key}) : super(key: key);

  @override
  State<ImcCalculator> createState() => _ImcCalculatorState();
}

//classe State onde serão tratados os dados
class _ImcCalculatorState extends State<ImcCalculator> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white70,
        body: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                //Construção do Form com 2 inputs e um botão
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputText(
                        label: "Altura",
                        hint: "Digite sua altura",
                        validator: (value) => value.length < 3 ||
                                value.length >= 5
                            ? null
                            : "Digite uma altura válida, ou contate o Guiness World Records",
                        onChanged: (value) =>
                            controller.onChange(userHeight: value),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      InputText(
                        label: "Peso",
                        hint: "Digite seu peso",
                        validator: (value) => value.length >= 4
                            ? null
                            : "Você é pesado demais para um ser humano, Gundams não tem IMC",
                        onChanged: (value) =>
                            controller.onChange(userWeight: value),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const CalcButton(),
                    ],
                  ),
                )
                // aqui irá entrar um text com o resultado da conta
                // const Text("Seu IMC é ${resultadoImc}, isto quer dizer que sua classificação atual é ${classificacao}")
                )));
  }
}
