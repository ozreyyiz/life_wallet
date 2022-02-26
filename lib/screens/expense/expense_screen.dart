import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:life_wallet/model/expense_item.dart';
import 'package:life_wallet/model/wallet.dart';
import 'package:life_wallet/widgets/bottom_navigation_bar.dart';
import 'package:life_wallet/widgets/item_box.dart';
import 'package:life_wallet/widgets/wallet_box.dart';

class ExpenseScreen extends StatefulWidget {
  ExpenseScreen({Key? key}) : super(key: key);

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  int currentIndex = 2;
  Stream<List<ExpenseItem>> getItems() {
    return FirebaseFirestore.instance
        .collection("expenseItems")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ExpenseItem.fromJson(doc.data()))
            .toList());
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
                  child: StreamBuilder<List<ExpenseItem>>(
                    stream: getItems(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var items = snapshot.data;
                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            ExpenseItem item = items[index];
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
