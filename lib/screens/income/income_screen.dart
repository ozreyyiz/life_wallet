import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:life_wallet/model/income_item.dart';
import 'package:life_wallet/widgets/bottom_navigation_bar.dart';
import 'package:life_wallet/widgets/item_box.dart';
import 'package:life_wallet/widgets/wallet_box.dart';

class IncomeScreen extends StatefulWidget {
  IncomeScreen({Key? key}) : super(key: key);

  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  int currentIndex = 1;

  Stream<List<IncomeItem>> readItem() {
    return FirebaseFirestore.instance.collection("incomeItems").snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => IncomeItem.fromJson(doc.data())).toList());
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
                walletBox(size),
                Expanded(
                  child: StreamBuilder<List<IncomeItem>>(
                    stream: readItem(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        final items = snapshot.data;
                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            IncomeItem item = items[index];
                            return ItemBox(
                              item: item,
                              currentIndex: currentIndex,
                            );
                          },
                        );
                      } 
                  
                      else {
                        return CircularProgressIndicator();
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
