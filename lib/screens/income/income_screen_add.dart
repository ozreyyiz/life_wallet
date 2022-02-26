import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:life_wallet/model/income_item.dart';
import 'package:life_wallet/screens/income/income_screen.dart';

import 'package:path/path.dart';

class IncomeItemAdd extends StatefulWidget {
  IncomeItemAdd({Key? key}) : super(key: key);

  @override
  State<IncomeItemAdd> createState() => _IncomeItemAddState();
}

class _IncomeItemAddState extends State<IncomeItemAdd> {
  TextEditingController itemNameCntrl = TextEditingController();
  TextEditingController itemPriceCntrl = TextEditingController();

  Future<void> addItem({required IncomeItem item}) async {
    final docItem = FirebaseFirestore.instance.collection("incomeItems").doc();
    item.item_id = docItem.id;
    final json = item.toJson();

    await docItem.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Earning Item Add"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: "Item Name"),
                controller: itemNameCntrl,
              ),
              TextField(
                decoration: const InputDecoration(hintText: "Item Price"),
                controller: itemPriceCntrl,
                keyboardType: TextInputType.number,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  final item = IncomeItem(
                    item_name: itemNameCntrl.text,
                    item_price: itemPriceCntrl.text,
                  );
                  addItem(item: item);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => IncomeScreen()));
                },
                icon: const Icon(Icons.save),
                label: const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
