import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/envio_viewmodel.dart';
import '../widgets/campo_numero.dart';

class FormularioPantalla extends StatefulWidget {
  const FormularioPantalla({super.key});

  @override
  State<FormularioPantalla> createState() => _FormularioPantallaState();
}

class _FormularioPantallaState extends State<FormularioPantalla> {
  //mapeo
  final pesoController = TextEditingController();
  final distanciaController = TextEditingController();

  @override
  void dispose() {
    pesoController.dispose();
    distanciaController.dispose();
    super.dispose();
  }

  void calcular() {
    double peso;
    double distancia;

    try {
      //paso de parametros
      peso = double.parse(pesoController.text.trim());
      distancia = double.parse(distanciaController.text.trim());
    } on FormatException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingresa un peso válido y una distancia válida.'),
        ),
      );
      return;
    }

    if (peso <= 0 || distancia < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingresa un peso válido y una distancia válida.'),
        ),
      );
      return;
    }

    //recibir a view model
    final vm = context.read<EnvioViewModel>();
    final resultado = vm.calcular(peso, distancia);

    //rutas
    Navigator.pushNamed(context, '/resultado', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    //para visualizar el view model en la pantalla
    final vm = context.watch<EnvioViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos del envío'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(child: Text(vm.usuario ?? 'Usuario')),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Calcula tu envío',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Ingresa el peso y la distancia para conocer el costo total.',
            ),
            const SizedBox(height: 24.0),
            CampoNumero(
              etiqueta: 'Peso del paquete (kg)',
              controller: pesoController,
            ),
            const SizedBox(height: 16.0),
            CampoNumero(
              etiqueta: 'Distancia del envío (km)',
              controller: distanciaController,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: calcular,
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}
