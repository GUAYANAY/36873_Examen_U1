import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String titulo;
  final String valor;
  final String? seleccionado;
  final ValueChanged<String?> onChanged;

  const OptionButton({
    super.key,
    required this.titulo,
    required this.valor,
    required this.seleccionado,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      title: Text(titulo),
      value: valor,
      groupValue: seleccionado,
      onChanged: onChanged,
    );
  }
}
