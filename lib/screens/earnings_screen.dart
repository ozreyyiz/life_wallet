import 'package:flutter/material.dart';
import 'package:life_wallet/db/earnable_itemdao.dart';
import 'package:life_wallet/model/earnable_item.dart';
import 'package:life_wallet/widgets/bottom_navigation_bar.dart';

class EarningsScreen extends StatefulWidget {
  EarningsScreen({Key? key}) : super(key: key);

  @override
  _EarningsScreenState createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
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
                  height: size.height / 8,
                  child: FutureBuilder(
                    future: getItems(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      var wallet = snapshot.data;
                      return Text("40₺");
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
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(item.item_name)),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text("${item.item_price} ₺")),
                                  )
                                ],
                              ),
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
            BottomNavigationBarHome(),
          ],
        ),
      ),
    );
  }
}
