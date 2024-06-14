/// Clase que representa una partida registrada en la base de datos.
class Partida {
  int? id; // Identificador único de la partida
  int usuarioId; // ID del usuario que realizó la partida
  String palabra; // Palabra adivinada en la partida
  int intentos; // Número de intentos realizados en la partida

  /// Constructor de la clase Partida.
  ///
  /// [id] es el identificador único de la partida.
  /// [usuarioId] es el ID del usuario que realizó la partida.
  /// [palabra] es la palabra adivinada en la partida.
  /// [intentos] es el número de intentos realizados en la partida.
  Partida(this.id, this.usuarioId, this.palabra, this.intentos);
}
