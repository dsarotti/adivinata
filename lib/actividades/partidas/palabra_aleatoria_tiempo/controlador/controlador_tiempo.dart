import 'dart:async';
import 'package:get/get.dart';

/// ControladorTiempo es una clase que extiende GetxController
/// y gestiona la lógica para un temporizador de cuenta regresiva.
///
/// Esta clase proporciona funcionalidades para:
/// - Iniciar la cuenta regresiva.
/// - Detener la cuenta regresiva.
/// - Reiniciar la cuenta regresiva.
/// - Actualizar el tiempo restante en un formato legible.
class ControladorTiempo extends GetxController {
  /// Define el tiempo de cuenta regresiva en segundos (1 minuto = 60 segundos).
  RxInt tiempoRestante = 60.obs;

  /// Texto formateado del tiempo restante.
  RxString tiempoRestanteTxt = "00:00".obs;

  /// Temporizador para la cuenta regresiva.
  Timer? _timer;

  /// Indica si el temporizador está activo.
  RxBool isActive = false.obs;

  /// Método para iniciar la cuenta regresiva.
  void iniciarCuentaAtras() {
    _timer?.cancel(); // Cancela cualquier temporizador existente
    isActive.value = true;
    tiempoRestante.value = 60; // Reinicia la cuenta regresiva a 60 segundos
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateFormattedTime();
      if (tiempoRestante.value > 0) {
        tiempoRestante.value--;
      } else {
        isActive.value = false;
        tiempoRestanteTxt.value = "00:00";
        _timer?.cancel();
      }
    });
  }

  /// Método para actualizar el tiempo restante en un formato legible.
  void updateFormattedTime() {
    tiempoRestanteTxt.value = '${(tiempoRestante.value ~/ 60).toString().padLeft(2, '0')}:${(tiempoRestante.value % 60).toString().padLeft(2, '0')}';
  }

  /// Método para detener la cuenta regresiva si es necesario.
  void detenerCuentaAtras() {
    _timer?.cancel();
  }

  /// Método para reiniciar la cuenta regresiva.
  void reiniciarCuentaAtras() {
    tiempoRestante.value = 0;
    tiempoRestanteTxt.value = "00:00";
    isActive.value = false;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
