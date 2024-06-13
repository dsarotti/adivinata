import 'dart:async';

import 'package:get/get.dart';

class ControladorTiempo extends GetxController{

  // Define the countdown time in seconds (1 minute = 60 seconds)
  RxInt tiempoRestante = 60.obs;
  RxString tiempoRestanteTxt="00:00".obs;
  Timer? _timer;
  RxBool isActive= false.obs;

  // Method to start the countdown
  void iniciarCuentaAtras() {
    _timer?.cancel(); // Cancel any existing timer
    isActive.value=true;
    tiempoRestante.value = 60; // Reset the countdown to 60 seconds
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateFormattedTime();
      if (tiempoRestante.value > 0) {
        tiempoRestante.value--;
      } else {
        isActive.value=false;
        tiempoRestanteTxt.value="00:00";
        _timer?.cancel();
      }
    });
  }

  updateFormattedTime() {
    tiempoRestanteTxt.value='${(tiempoRestante.value ~/ 60).toString().padLeft(2, '0')}:${(tiempoRestante.value % 60).toString().padLeft(2, '0')}';
  }

  // Method to stop the countdown if needed
  void detenerCuentaAtras() {
    _timer?.cancel();
  }

  void reiniciarCuentaAtras(){
    tiempoRestante.value=0;
    tiempoRestanteTxt.value="00:00";
    isActive.value=false;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

}