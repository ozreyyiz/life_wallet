import 'package:life_wallet/db/dbhelper.dart';
import 'package:life_wallet/model/wallet.dart';

class Walletdao {
  Future<List<Wallet>> getWallet() async {
    var db = await DbHelper.dbAccess();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM wallet");
    return List.generate(maps.length, (i) {
      var line = maps[i];
      return Wallet(line["wallet"]);
    });
  }

  Future<void> updateItem(int wallet) async {
    var db = await DbHelper.dbAccess();
    var datas = Map<String, dynamic>();
    datas["wallet"] = wallet;

    await db.update(
      "wallet",
      datas,
    );
  }
}
