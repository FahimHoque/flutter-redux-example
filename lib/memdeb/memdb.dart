// ignore_for_file: prefer_final_fields

import 'dart:developer';

class Memdb {
  static Map<String, dynamic> _db = {};

  static void set(String key, dynamic value) => _db[key] = value;

  static dynamic get(String key) => _db[key];

  static void delete(String key) => _db.remove(key);

  static void clear() => _db.clear();

  static void printDb() => log(_db.toString());

  static void printDbKeys() => log(_db.keys.toString());
}
