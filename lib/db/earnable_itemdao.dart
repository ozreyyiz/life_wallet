import 'package:life_wallet/db/dbhelper.dart';
import 'package:life_wallet/model/earnable_item.dart';

class Earnabledao {
  Future<List<EarnableItem>> getItems() async {
    var db = await DbHelper.dbAccess();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM earnable_items");
    return List.generate(maps.length, (i) {
      var line = maps[i];
      return EarnableItem(
          line["item_id"], line["item_name"], line["item_price"]);
    });
  }

  Future<void> addItem(String item_name, int item_price) async {
    var db = await DbHelper.dbAccess();
    var datas = Map<String, dynamic>();
    datas["item_name"] = item_name;
    datas["item_price"] = item_price;
    await db.insert("earnable_items", datas);
  }

  Future<void> updateItem(int item_id, String item_name, int item_price) async {
    var db = await DbHelper.dbAccess();
    var datas = Map<String, dynamic>();
    datas["item_name"] = item_name;
    datas["item_price"] = item_price;
    await db.update("earnable_items", datas,
        where: "item_id=?", whereArgs: [item_id]);
  }

  Future<void> deleteGrade(int item_id) async {
    var db = await DbHelper.dbAccess();

    await db
        .delete("earnable_items", where: "item_id =?", whereArgs: [item_id]);
  }
}
