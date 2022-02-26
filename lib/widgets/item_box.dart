import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:life_wallet/model/income_item.dart';
import 'package:life_wallet/model/expense_item.dart';
import 'package:life_wallet/model/wallet.dart';
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
                  onPressed: () {},
                  child: Text("${widget.item.item_price} ₺")),
            )
          ],
        ),
      ),
    );
  }
}
