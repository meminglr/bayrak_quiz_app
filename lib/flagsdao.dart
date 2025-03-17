import 'package:flag_quiz_app/database_helper.dart';
import 'package:flag_quiz_app/flags.dart';

class Flagsdao {
  Future<List<Flags>> getRandom5Flags() async {
    var db = await DatabaseHelper.accessToDatabase();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM flags ORDER BY RANDOM() LIMIT 5 ");
    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Flags(
          flag_id: line["flag_id"],
          flag_name: line["flag_name"],
          flag_image: line["flag_image"]);
    });
  }

  Future<List<Flags>> get3WrogFlag(int flag_id) async {
    var db = await DatabaseHelper.accessToDatabase();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        " SELECT * FROM flags WHERE flag_id != $flag_id ORDER BY RANDOM() LIMIT 3 ");
    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Flags(
          flag_id: line["flag_id"],
          flag_name: line["flag_name"],
          flag_image: line["flag_image"]);
    });
  }
}
