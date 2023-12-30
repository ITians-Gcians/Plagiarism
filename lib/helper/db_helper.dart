// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// import '../model/plag_item.dart';

// class DatabaseHelper {
//   late Database _database;
//   DatabaseHelper() {
//     initDatabase();
//   }
//   Future<void> initDatabase() async {
//     _database = await openDatabase(
//       join(await getDatabasesPath(), 'plagremover.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE plag_items(id TEXT PRIMARY KEY, query TEXT, )',
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<List<PlagItem>> getItems() async {
//     final List<Map<String, dynamic>> maps = await _database.query('plag_items');

//     return List.generate(
//       maps.length,
//       (i) {
//         return PlagItem(
//           id: maps[i]['id'],
//           query: maps[i]['title'],
//           //  result: maps[i]['result'],
//         );
//       },
//     );
//   }

//   Future<void> insertItem(PlagItem item) async {
//     await _database.insert(
//       'plag_items',
//       item.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<void> deleteItem(String id) async {
//     await _database.delete('plag_items', where: 'id = ?', whereArgs: [id]);
//   }
// }
