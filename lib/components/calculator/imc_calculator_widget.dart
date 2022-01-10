import 'package:flutter/material.dart';
import 'package:imc/components/calc_button/calc_button.dart';
import 'package:imc/components/input_text/input_text.dart';
import 'package:imc/components/controllers/imc_controller.dart';

//Definição da classe Form
class ImcCalculator extends StatefulWidget {
  const ImcCalculator({Key? key}) : super(key: key);

  @override
  State<ImcCalculator> createState() => _ImcCalculatorState();
}

//classe State onde serão tratados os dados
class _ImcCalculatorState extends State<ImcCalculator> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final controller = ImcController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text("Calculadora de IMC")),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                //Construção do Form com 2 inputs e um botão
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: AnimatedBuilder(
                          animation: controller,
                          builder: (context, widget) {
                            return (Text(controller.textStart,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18)));
                          }),
                    ),
                    Form(
                      child: Column(
                        children: [
                          InputText(
                              label: "Altura",
                              hint: "Digite sua altura",
                              // validator: (value) => value.length < 3 ||
                              //         value.length >= 4
                              //     ? null
                              //     : "Digite uma altura válida, ou contate o Guiness World Records",
                              onChanged: (value) => controller.onChange(
                                  altura: double.parse(value))),
                          const SizedBox(
                            height: 18,
                          ),
                          InputText(
                              label: "Peso",
                              hint: "Digite seu peso",
                              // validator: (value) => value.length >= 4
                              //     ? null
                              //     : "Você é pesado demais para um ser humano, Gundams não precisam de IMC",
                              onChanged: (value) => controller.onChange(
                                  peso: double.parse(value))),
                          const SizedBox(
                            height: 18,
                          ),
                          CalcButton(controller: controller),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
