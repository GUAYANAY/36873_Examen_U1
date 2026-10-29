import 'package:flutter/foundation.dart';

import '../model/envio_model.dart';

class EnvioViewModel extends ChangeNotifier {
  //variable
  String? usuario;
  String? mensajeError;

  //metodos
  bool iniciarSesion(String correo, String contrasena) {
    if (correo == 'admin@gmail.com' && contrasena == '1234') {
      usuario = correo;
      mensajeError = null;
      notifyListeners();
      return true;
    }

    mensajeError = 'El correo o la contraseña no son correctos.';
    notifyListeners();
    return false;
  }

  //metodos
  EnvioModel calcular(double peso, double distancia) {
    final tarifa = peso <= 5 ? 2.0 : 3.0;
    final costoBase = peso * tarifa;
    final recargo = distancia > 100 ? costoBase * 0.10 : 0.0;
    final total = costoBase + recargo;

    return EnvioModel(
      peso: peso,
      distancia: distancia,
      costoBase: costoBase,
      recargo: recargo,
      total: total,
    );
  }
}
