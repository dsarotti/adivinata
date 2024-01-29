import 'dart:math';

class Palabras{

  static final List<String> _listaPalabras =  [
    'manzana', 'jirafa', 'océano', 'barco', 'techo',
    'torre', 'fiesta', 'veloz', 'flecha', 'sabio',
    'zapato', 'rayo', 'piedra', 'nube', 'risas',
    'alma', 'cuerda', 'tigre', 'guitarra', 'carro'
  ];

  Palabras._palabras();

  static String obtenerPalabraAleatoria() {
    Random random = Random();
    int indiceAleatorio = random.nextInt(_listaPalabras.length);
    return _listaPalabras[indiceAleatorio];
  }
}