import 'package:flutter/material.dart';
import 'package:life_wallet/db/earnable_itemdao.dart';
import 'package:life_wallet/screens/earnable/earnings_screen.dart';

import 'package:path/path.dart';

class EarningItemAdd extends StatefulWidget {
  EarningItemAdd({Key? key}) : super(key: key);

  @override
  State<EarningItemAdd> createState() => _EarningItemAddState();
}

class _EarningItemAddState extends State<EarningItemAdd> {
  TextEditingController itemNameCntrl = TextEditingController();
  TextEditingController itemPriceCntrl = TextEditingController();

  Future<void> addItem(String itemName, int itemPrice) async {
    await Earnabledao().addItem(itemName, itemPrice);
    Navigator.pushReplacement(this.context,
        MaterialPageRoute(builder: (context) => EarningsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Earning Item Add"),
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
                          builder: (context) => EarningsScreen()));
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
