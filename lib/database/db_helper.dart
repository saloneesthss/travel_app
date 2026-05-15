import 'package:travel_app/models/destination.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  DatabaseHelper._internal();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = join(await getDatabasesPath(), 'travel_app.db');
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createTables,
    );
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE destinations (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        location TEXT NOT NULL,
        country TEXT NOT NULL,
        imageUrl TEXT NOT NULL,
        rating REAL NOT NULL,
        reviewCount INTEGER NOT NULL,
        startPrice REAL NOT NULL,
        distance TEXT NOT NULL,
        description TEXT NOT NULL,
        amenities TEXT NOT NULL,
        highlights TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE favorites (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        destinationId TEXT NOT NULL,
        UNIQUE(userId, destinationId)
      )
    ''');
    await _seedDestinations(db);
  }

  Future<void> _seedDestinations(Database db) async {
    final List<Map<String, dynamic>> destinationSeedData = allDestinations.map((d) {
      return {
        'id': d.id,
        'name': d.name,
        'location': d.location,
        'country': d.country,
        'imageUrl': d.imageUrl,
        'rating': d.rating,
        'reviewCount': d.reviewCount,
        'startPrice': d.startPrice,
        'distance': d.distance,
        'description': d.description,
        'amenities': d.amenities.join(','),
        'highlights': d.highlights.join(','),
      };
    }).toList();

    for (final dest in destinationSeedData) {
      await db.insert('destinations', dest);
    }
  }

  Future<int?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final db = await database;
    final hashedPassword = _hashPassword(password);

    try {
      final id = await db.insert(
        'users',
        {
          'name': name,
          'email': email.toLowerCase().trim(),
          'password': hashedPassword,
        },
      );
      return id;
    } catch (e) {
      return null; 
    }
  }

  Future<Map<String, dynamic>?> login({
    required String email,
    required String password,
  }) async {
    final db = await database;
    final hashedPassword = _hashPassword(password);

    final results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email.toLowerCase().trim(), hashedPassword],
    );

    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  Future<List<Map<String, dynamic>>> getAllDestinations() async {
    final db = await database;
    return await db.query('destinations');
  }

  Future<void> addFavorite({
    required int userId,
    required String destinationId,
  }) async {
    final db = await database;

    await db.insert(
      'favorites',
      {'userId': userId, 'destinationId': destinationId},
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<void> removeFavorite({
    required int userId,
    required String destinationId,
  }) async {
    final db = await database;

    await db.delete(
      'favorites',
      where: 'userId = ? AND destinationId = ?',
      whereArgs: [userId, destinationId],
    );
  }

  Future<Set<String>> getFavoriteIds(int userId) async {
    final db = await database;
    final rows = await db.query(
      'favorites',
      columns: ['destinationId'],
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return rows.map((row) => row['destinationId'] as String).toSet();
  }

  Future<bool> isFavorite({
    required int userId,
    required String destinationId,
  }) async {
    final db = await database;

    final rows = await db.query(
      'favorites',
      where: 'userId = ? AND destinationId = ?',
      whereArgs: [userId, destinationId],
    );

    return rows.isNotEmpty;
  }
}