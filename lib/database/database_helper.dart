import 'dart:io';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../model/partida.dart';
import '../model/usuario.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'adivinata.db');
    var db = await openDatabase(path);
    _onCreate(db);
    return db;
  }

  Future<void> borrardb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'adivinata.db');
    if (await databaseExists(path)) {
      await deleteDatabase(path);
    }
  }


  void _onCreate(Database db) {
    db.execute('''
      CREATE TABLE IF NOT EXISTS usuarios(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre_usuario TEXT,
        apellidos INTEGER,
        email INTEGER,
        pass INTEGER
      )
      ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS partidas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INT,
        palabra TEXT,
        intentos INTEGER,
        FOREIGN KEY (usuario_id) REFERENCES flavors(usuarios)
      )
      ''');
  }

  Future<void> dropDatabase() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, 'adivinata.db');
      final file = File(path);

      if (await file.exists()) {
        await file.delete();
        Get.log('Base de datos eliminada correctamente.');
      } else {
        Get.log('La base de datos no existe.');
      }
    } catch (e) {
      Get.log('Error al eliminar la base de datos: $e');
    }
  }

// Métodos de partidas

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

  //Métodos de usuarios
  Future<int?> insertUsuario(Usuario usuario,String pass) async {
    final db = await database;
    int? id = await db.insert('usuarios',
      {"nombre_usuario":usuario.nombreUsuario, "apellidos":usuario.apellidos, "email":usuario.correoElectronico, "pass":pass},
        conflictAlgorithm: ConflictAlgorithm.abort
    );
    return id;
  }

  Future<Usuario?> getUsuario(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> rs = await db.rawQuery('SELECT id,nombre_usuario,apellidos,email FROM usuarios WHERE id = ?', [id],);
    if (rs.isNotEmpty) {
      Usuario usuario = Usuario(
        rs.first["id"],
        rs.first["nombre_usuario"],
        rs.first["apellidos"],
        rs.first["email"],

      );
      return usuario;
    } else {
      return null;
    }
  }

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

  Future<bool> registro(Usuario usuario, pass) async{
    final db = await database;
    final List<Map<String, dynamic>> rs = await db.rawQuery('SELECT id FROM usuarios WHERE nombre_usuario = ?',[usuario.nombreUsuario]);
    if (rs.isNotEmpty) {
      return false;
    } else {
      return await insertUsuario(usuario, pass) != null;
    }
  }
}