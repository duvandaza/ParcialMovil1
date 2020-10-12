import 'dart:io';

import 'package:parcial1/src/model/nota_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {

  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async{

    if ( _database != null ) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join( documentsDirectory.path, 'NotaDB.db' );

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: ( Database db, int version ) async {
        await db.execute(
          'CREATE TABLE Nota ('
          ' id INTEGER PRIMARY KEY,'
          ' materia TEXT,'
          ' corte1 TEXT,'
          ' corte2 TEXT,'
          ' corte3 TEXT,'
          ' definitiva TEXT'
          ')'
        );
      }
    );
  }

  nuevoScanRaw( NotaModel nuevoNota ) async {

    final db = await database;

    final res = await db.rawInsert(
      "INSERT Into Nota (id, tipo, valor) "
      "VALUES ( ${ nuevoNota.id }, '${ nuevoNota.materia }', '${ nuevoNota.corte1 }', '${ nuevoNota.corte2 }', '${ nuevoNota.corte3 }', '${ nuevoNota.definitiva }' )"
    );
    return res;
  }

  // Metodo corto y mas seguro
  nuevoNota( NotaModel nuevoNota ) async {

    final db = await database;
    final res = await db.insert('Nota', nuevoNota.toJson());
    return res;
  }

  // Select- obtener informacion
  Future<NotaModel> getNotaId( int  id ) async {
    
    final db = await database;
    final res = await db.query( 'Nota', where: 'id= ?', whereArgs: [id] );
    return res.isNotEmpty ? NotaModel.fromJson( res.first ) : null;
  }

  Future<List<NotaModel>> getTodosNota() async {
    final db = await database;
    final res = await db.query('Nota');
    
    List<NotaModel> list = res.isNotEmpty
                          ? res.map((c) => NotaModel.fromJson(c)).toList()
                          : [];
    return list;
  }

  // Actualizar Registro
  Future<int> updateNota( NotaModel nuevoNota ) async {
    
    final db = await database;
    final res = await db.update('Nota', nuevoNota.toJson(), where: 'id = ?', whereArgs:[nuevoNota.id]);
    return res;
  
  }

  // Eliminar registro
  Future<int> deleteNota( int id ) async {
    
    final db = await database;
    final res = await db.delete('Nota', where: 'id = ?', whereArgs: [id] );
    return res;

  }



}