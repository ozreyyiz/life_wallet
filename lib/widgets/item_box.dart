import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:life_wallet/model/income_item.dart';
import 'package:life_wallet/model/expense_item.dart';
import 'package:life_wallet/model/wallet.dart';
import 'package:life_wallet/widgets/wallet_box.dart';
import 'package:path/path.dart';

class ItemBox extends StatefulWidget {
  const ItemBox({
    Key? key,
    required this.item,
    required this.currentIndex,
  }) : super(key: key);

  final item;
  final int currentIndex;

  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {
  Future<void> deleteEarningItem(String itemId) async {
    final docItem =
        FirebaseFirestore.instance.collection("incomeItems").doc(itemId);
    docItem.delete();
  }

  Future<void> deleteSellableItem(String itemId) async {
    final docItem =
        FirebaseFirestore.instance.collection("expenseItems").doc(itemId);
    docItem.delete();
  }

  Stream<List<Wallet>> readWallet() {
    return FirebaseFirestore.instance.collection("wallet").snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Wallet.fromJson(doc.data())).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Dismissible(
        onDismissed: (direction) {
          widget.currentIndex == 1
              ? deleteEarningItem(widget.item.item_id)
              : deleteSellableItem(widget.item.item_id);
        },
        direction: DismissDirection.endToStart,
        key: Key(widget.item.item_id),
        background: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(widget.item.item_name)),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        widget.currentIndex == 1 ? Colors.blue : Colors.red,
                  ),
                  onPressed: () {
                    final docWallet = FirebaseFirestore.instance
                        .collection("wallet")
                        .doc("0GFX627NXPAlnd6a0zqz");

                    docWallet.update({
                      "wallet_amount": widget.currentIndex == 1
                          ? walletAmount + int.parse(widget.item.item_price)
                          : walletAmount - int.parse(widget.item.item_price)
                    });
                  },
                  child: Text("${widget.item.item_price} ₺")),
            )
          ],
        ),
      ),
    );
  }
}
