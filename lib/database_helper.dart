import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String database_name = "flagquiz.sqlite";

  static Future<Database> accessToDatabase() async {
    String databasePath = join(await getDatabasesPath(), database_name);

    if (await databaseExists(databasePath)) {
      //Veritabanı var mı yok mu kontrolü
      print("Veri tabanı zaten var.Kopyalamaya gerek yok");
    } else {
      //assetten veritabanının alınması
      ByteData data = await rootBundle.load("database/$database_name");
      //Veritabanının kopyalama için byte dönüşümü
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      //Veritabanının kopyalanması.
      await File(databasePath).writeAsBytes(bytes, flush: true);
      print("Veri tabanı kopyalandı");
    }
    //Veritabanını açıyoruz.
    return openDatabase(databasePath);
  }
}
