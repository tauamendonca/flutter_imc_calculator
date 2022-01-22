import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final void Function(String)? onChanged;
  final String? Function(String)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  const InputText({
    Key? key,
    required this.label,
    required this.hint,
    this.onChanged,
    this.validator,
    this.inputFormatters, //pesquisar
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(
          //pesquisar uma maneira melhor de fazer a separação (padding?)
          height: 12,
        ),
        TextFormField(
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          scrollPadding: const EdgeInsets.only(bottom: 40),
          validator: (value) {
            if (validator != null) {
              return validator!(value ?? "");
            }
          },
          decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.teal))),
        ),
      ],
    );
  }
}
