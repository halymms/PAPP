import 'dart:async';
import 'dart:core';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trabalho_app/model/pessoa.dart';
import 'package:trabalho_app/model/animal.dart';

class Banco {
  //Singleton
  Banco._internal();

  static final Banco _db = Banco._internal();

  static Banco get() {
    return _db;
  }

  //SQLite
  Database _dbSqlite;

  Future<Database> _getSqlite() async {
    //if (_dbSqlite != null) {
    //return _dbSqlite;
    //} else {
    _dbSqlite = await _abrirSqlite();
    return _dbSqlite;
    //}
  }


  Future<Database> _abrirSqlite() async {
    final path = join(await getDatabasesPath(), "Tabelas.db");
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE pessoas("
                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "nome TEXT,"
                "email TEXT,"
                "telefone TEXT,"
                "senha TEXT);"
                "CREATE TABLE animais("
                "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                "nome TEXT,"
                "especie TEXT,"
                "raca TEXT,"
                "caracteristicas TEXT,"
                "dono INT,"
                "FOREIGN KEY (dono) REFERENCES pessoas(id)",
          );

        });

  }
  //----------------------------------------CRUD INCLUSÃO----------------------------------------
  Future<Animal> incluirAnimal(Animal animal) async{
    Database db = await _getSqlite();
    animal.id = await db.insert('animais', animal.toMap());
  }


  Future<Pessoa> incluirPessoa(Pessoa pessoa) async {
    Database db = await _getSqlite();
    pessoa.id = await db.insert('pessoas', pessoa.toMap());
    return pessoa;
  }


  //----------------------------------------CRUD ATUALIZAR----------------------------------------

  Future<int> atualizarAnimal(Animal animal) async{
    Database db = await _getSqlite();
    return await db.update('animais', animal.toMap(),
        where: 'id = ?', whereArgs: [animal.id]);
  }

  Future<int> atualizarPessoa(Pessoa pessoa) async {
    Database db = await _getSqlite();
    return await db.update('pessoas', pessoa.toMap(),
        where: 'id = ?', whereArgs: [pessoa.id]);
  }

  //----------------------------------------CRUD EXCLUIR----------------------------------------

  Future<int> excluirAnimal(int id) async{
    Database db = await _getSqlite();
    return await db.delete('animais', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> excluirPessoa(int id) async {
    Database db = await _getSqlite();
    return await db.delete('pessoas', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> excluirTodasPessoas() async {
    Database db = await _getSqlite();
    return await db.delete('pessoas');
  }
  //----------------------------------------CRUD LISTAR----------------------------------------

  Future<List<Animal>> listarAniamalTodos() async{
    final Database db = await _getSqlite();
    final List<Map<String, dynamic>> maps = await db.query('animais');
    return List.generate(maps.length, (i){
      return Animal(
          id: maps[i] ['id'],
          nome: maps[i] ['nome'],
          raca: maps[i] ['raca'],
          especie: maps[i] ['especie'],
          caracteristicas: maps[i] ['caracteristicas'],
          cor: maps[i] ['cor'],
          dono: maps[i] ['dono']
      );
    });
  }

  Future<List<Animal>> listarAnimal(int id) async{
    Database db = await _getSqlite();
    final List<Map<String, dynamic>> maps = await db.query('animais', where: 'id  = ?', whereArgs: [id]);
    return List.generate(maps.length, (i){
      return Animal(
          id: maps[i]['id'],
          dono: maps[i]['dono'],
          cor: maps[i]['cor'],
          caracteristicas: maps[i]['caracteristicas'],
          especie: maps[i]['especie'],
          nome: maps[i]['nome'],
          raca: maps[i]['raca']
      );
    });
  }

  Future<List<Pessoa>> listarPessoa(int id) async {
    final Database db = await _getSqlite();
    final List<Map<String, dynamic>> maps = await db.query('pessoas', where: 'id = ?', whereArgs: [id]);
    return List.generate(maps.length, (i) {
      return Pessoa(
          id: maps[i]['id'],
          nome: maps[i]['nome'],
          email: maps[i] ['email'],
          telefone: maps[i] ['telefone'],
          senha: maps[i] ['senha']
      );
    });
  }

  Future<List<Pessoa>> listarPessoaTodos() async {
    final Database db = await _getSqlite();
    final List<Map<String, dynamic>> maps = await db.query('pessoas');
    return List.generate(maps.length, (i) {
      return Pessoa(
          id: maps[i]['id'],
          nome: maps[i]['nome'],
          email: maps[i] ['email'],
          telefone: maps[i] ['telefone'],
          senha: maps[i] ['senha']
      );
    });
  }

}