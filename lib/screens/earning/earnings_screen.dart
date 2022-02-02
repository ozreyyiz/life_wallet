import 'package:flutter/material.dart';
import 'package:life_wallet/db/earnable_itemdao.dart';
import 'package:life_wallet/model/earnable_item.dart';
import 'package:life_wallet/widgets/bottom_navigation_bar.dart';
import 'package:life_wallet/widgets/item_box.dart';

class EarningsScreen extends StatefulWidget {
  EarningsScreen({Key? key}) : super(key: key);

  @override
  _EarningsScreenState createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  int currentIndex = 1;
  var items = <EarnableItem>[];
  Future<List<EarnableItem>> getItems() async {
    items = await Earnabledao().getItems();
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
              color: Colors.green,
            ),
            Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height / 8,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                      ),
                      color: Colors.grey),
                  child: FutureBuilder(
                    future: getItems(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      var wallet = snapshot.data;
                      return Center(
                        child: Text("40₺"),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: getItems(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var items = snapshot.data;
                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            EarnableItem item = items[index];
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
