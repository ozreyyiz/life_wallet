import 'package:flutter/material.dart';
import 'package:life_wallet/db/earnable_itemdao.dart';
import 'package:life_wallet/db/sellable_itemdao.dart';
import 'package:life_wallet/screens/earnable/earnings_screen.dart';
import 'package:life_wallet/screens/sellable/selling_screen.dart';

import 'package:path/path.dart';

class SellingItemAdd extends StatefulWidget {
  SellingItemAdd({Key? key}) : super(key: key);

  @override
  State<SellingItemAdd> createState() => _SellingItemAddState();
}

class _SellingItemAddState extends State<SellingItemAdd> {
  TextEditingController itemNameCntrl = TextEditingController();
  TextEditingController itemPriceCntrl = TextEditingController();

  Future<void> addItem(String itemName, int itemPrice) async {
    await Sellabledao().addItem(itemName, itemPrice);
    Navigator.pushReplacement(this.context,
        MaterialPageRoute(builder: (context) => EarningsScreen()));
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
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  int price = int.parse(itemPriceCntrl.text);
                  addItem(itemNameCntrl.text, price);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SellingScreen())));
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
