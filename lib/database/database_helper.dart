import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../model/partida.dart';
import '../model/usuario.dart';
import 'package:sqflite/sqflite.dart';

/// DatabaseHelper es una clase singleton que proporciona métodos para interactuar con la base de datos SQLite.
///
/// Esta clase proporciona funcionalidades para:
/// - Inicializar la base de datos.
/// - Crear tablas.
/// - Insertar, obtener y listar registros de las tablas de partidas y usuarios.
/// - Manejar el inicio de sesión y el registro de usuarios.
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  /// Obtiene la instancia de la base de datos, inicializándola si es necesario.
  Future<Database> get database async {
    if (_database != null && _database!.isOpen) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Inicializa la base de datos, creando las tablas necesarias.
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'adivinata.db');
    var db = await openDatabase(path);
    _onCreate(db);
    return db;
  }

  /// Borra la base de datos existente y la reinicializa.
  Future<void> borrardb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'adivinata.db');
    if (await databaseExists(path)) {
      await deleteDatabase(path);
    }
    _database = await _initDatabase();
  }

  /// Crea las tablas `usuarios` y `partidas` si no existen.
  void _onCreate(Database db) {
    db.execute('''
      CREATE TABLE IF NOT EXISTS usuarios(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre_usuario TEXT,
        email TEXT,
        pass TEXT
      )
      ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS partidas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INT,
        palabra TEXT,
        intentos INTEGER,
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
      )
      ''');
  }

  // Métodos de partidas

  /// Inserta una nueva partida en la tabla `partidas`.
  ///
  /// [partida] es el objeto Partida que se va a insertar.
  Future<void> insertPartida(Partida partida) async {
    final db = await database;
    await db.insert(
      'partidas',
      {
        'usuario_id': partida.usuarioId,
        'palabra': partida.palabra,
        'intentos': partida.intentos,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Obtiene una lista de todas las partidas de la tabla `partidas`.
  ///
  /// Retorna una lista de objetos Partida.
  Future<List<Partida>> getPartidasList() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('partidas', columns: ['id']);

    List<Partida> partidasList = [];
    for (var element in result) {
      Partida? p = await getPartida(element['id'] as int);
      if (p != null) {
        partidasList.add(p);
      }
    }
    return partidasList;
  }

  /// Obtiene una partida específica por su ID.
  ///
  /// [id] es el ID de la partida.
  ///
  /// Retorna un objeto Partida o null si no se encuentra.
  Future<Partida?> getPartida(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> rs = await db.query(
      'partidas',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (rs.isNotEmpty) {
      Partida partida = Partida(
        rs.first['id'] as int,
        rs.first['usuario_id'] as int,
        rs.first['palabra'] as String,
        rs.first['intentos'] as int,
      );
      return partida;
    } else {
      return null;
    }
  }

  // Métodos de usuarios

  /// Inserta un nuevo usuario en la tabla `usuarios`.
  ///
  /// [usuario] es el objeto Usuario que se va a insertar.
  /// [pass] es la contraseña del usuario.
  ///
  /// Retorna el ID del usuario insertado o null si falla.
  Future<int?> insertUsuario(Usuario usuario, String pass) async {
    final db = await database;
    int? id = await db.insert('usuarios',
        {
          "nombre_usuario": usuario.nombreUsuario,
          "email": usuario.correoElectronico,
          "pass": pass
        },
        conflictAlgorithm: ConflictAlgorithm.abort
    );
    return id;
  }

  /// Obtiene un usuario específico por su ID.
  ///
  /// [id] es el ID del usuario.
  ///
  /// Retorna un objeto Usuario o null si no se encuentra.
  Future<Usuario?> getUsuario(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> rs = await db.rawQuery('SELECT id, nombre_usuario, email FROM usuarios WHERE id = ?', [id]);
    if (rs.isNotEmpty) {
      Usuario usuario = Usuario(
        rs.first["id"],
        rs.first["nombre_usuario"],
        rs.first["email"],
      );
      return usuario;
    } else {
      return null;
    }
  }

  /// Inicia sesión comprobando el nombre de usuario y la contraseña.
  ///
  /// [nombreUsuario] es el nombre de usuario.
  /// [pass] es la contraseña.
  ///
  /// Retorna el ID del usuario si las credenciales son correctas, de lo contrario retorna null.
  Future<int?> login(String nombreUsuario, String pass) async {
    final Database db = await database;
    final List<Map<String, dynamic>> rs = await db.query(
      'usuarios',
      columns: ['id'],
      where: 'nombre_usuario = ? AND pass = ?',
      whereArgs: [nombreUsuario, pass],
    );

    if (rs.isNotEmpty) {
      return rs.first['id'];
    } else {
      return null;
    }
  }

  /// Registra un nuevo usuario comprobando si el nombre de usuario ya existe.
  ///
  /// [usuario] es el objeto Usuario a registrar.
  /// [pass] es la contraseña del usuario.
  ///
  /// Retorna true si el registro es exitoso, de lo contrario false.
  Future<bool> registro(Usuario usuario, String pass) async {
    final db = await database;
    final List<Map<String, dynamic>> rs = await db.rawQuery('SELECT id FROM usuarios WHERE nombre_usuario = ?', [usuario.nombreUsuario]);
    if (rs.isNotEmpty) {
      return false;
    } else {
      return await insertUsuario(usuario, pass) != null;
    }
  }
}
