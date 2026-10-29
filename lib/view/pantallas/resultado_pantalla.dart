import 'package:flutter/material.dart';

import '../../model/envio_model.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    //recibir parametros
    final miDato = ModalRoute.of(context)!.settings.arguments as EnvioModel;

    Widget dato(String titulo, String valor) {
      return ListTile(
        title: Text(titulo),
        trailing: Text(
          valor,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado del envío')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.receipt_long,
                  color: Colors.deepPurple,
                  size: 56.0,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Detalle del costo',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12.0),
                dato('Peso', '${miDato.peso.toStringAsFixed(2)} kg'),
                dato('Distancia', '${miDato.distancia.toStringAsFixed(2)} km'),
                dato('Costo base', '\$${miDato.costoBase.toStringAsFixed(2)}'),
                dato('Recargo (10%)', '\$${miDato.recargo.toStringAsFixed(2)}'),
                const Divider(),
                dato('Total', '\$${miDato.total.toStringAsFixed(2)}'),
                const SizedBox(height: 12.0),
                //boton de regreso:
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Regresar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
