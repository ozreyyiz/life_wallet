import 'package:flutter/material.dart';
import 'package:life_wallet/db/earnable_itemdao.dart';
import 'package:life_wallet/model/earnable_item.dart';
import 'package:path/path.dart';

class ItemBox extends StatefulWidget {
  const ItemBox({
    Key? key,
    required this.item,required this.currentIndex,
  }) : super(key: key);

  final EarnableItem item;
  final int currentIndex;

  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {

Future<void> deleteEarningItem(int itemId)async{
await Earnabledao().deleteGrade(itemId);
}

Future<void> deleteSellableItem(int itemId)async{

}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Dismissible(
        onDismissed: (direction) {
          widget.currentIndex==1?deleteEarningItem(widget.item.item_id):deleteSellableItem(widget.item.item_id);
        },
        direction: DismissDirection.endToStart,
        key: Key(widget.item.item_name),
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
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(widget.item.item_name)),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("${widget.item.item_price} ₺")),
            )
          ],
        ),
      ),
    );
  }
}
