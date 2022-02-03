import 'package:flutter/material.dart';
import 'package:life_wallet/db/sellable_itemdao.dart';
import 'package:life_wallet/db/walletdao.dart';
import 'package:life_wallet/model/sellable_item.dart';
import 'package:life_wallet/model/wallet.dart';
import 'package:life_wallet/widgets/bottom_navigation_bar.dart';
import 'package:life_wallet/widgets/item_box.dart';
import 'package:life_wallet/widgets/wallet_box.dart';

class SellingScreen extends StatefulWidget {
  SellingScreen({Key? key}) : super(key: key);

  @override
  _SellingScreenState createState() => _SellingScreenState();
}

class _SellingScreenState extends State<SellingScreen> {
  int currentIndex = 2;
  var items = <SellableItem>[];
  Future<List<SellableItem>> getItems() async {
    items = await Sellabledao().getItems();
    return items;
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: Colors.white,
            ),
            Column(
              children: [
                walletBox(size),
                Expanded(
                  child: FutureBuilder(
                    future: getItems(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var items = snapshot.data;
                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            SellableItem item = items[index];
                            return ItemBox(
                              item: item,
                              currentIndex: currentIndex,
                            );
                          },
                        );
                      } else {
                        return Center();
                      }
                    },
                  ),
                ),
              ],
            ),
            BottomNavigationBarHome(
              currentIndex: currentIndex,
            ),
          ],
        ),
      ),
    );
  }
}
