import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:life_wallet/model/expense_item.dart';
import 'package:life_wallet/model/income_item.dart';
import 'package:life_wallet/screens/expense/expense_screen.dart';

import 'package:path/path.dart';

class ExpenseItemAdd extends StatefulWidget {
  ExpenseItemAdd({Key? key}) : super(key: key);

  @override
  State<ExpenseItemAdd> createState() => _ExpenseItemAddState();
}

class _ExpenseItemAddState extends State<ExpenseItemAdd> {
  TextEditingController itemNameCntrl = TextEditingController();
  TextEditingController itemPriceCntrl = TextEditingController();

  Future<void> addItem({required ExpenseItem item}) async {
    final docItem = FirebaseFirestore.instance.collection("expenseItems").doc();
    item.item_id = docItem.id;
    final json = item.toJson();

    await docItem.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Selling Item Add"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Item Name"),
                controller: itemNameCntrl,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Item Price"),
                controller: itemPriceCntrl,
                keyboardType: TextInputType.number,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  final item = ExpenseItem(
                    item_name: itemNameCntrl.text,
                    item_price: itemPriceCntrl.text,
                  );
                  addItem(item: item);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ExpenseScreen())));
                },
                icon: Icon(Icons.save),
                label: Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
