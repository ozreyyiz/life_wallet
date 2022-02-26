class ExpenseItem {
 String item_id;
  final String item_name;
  final String item_price;

  ExpenseItem({
    this.item_id = "",
    required this.item_name,
    required this.item_price,
  });

  Map<String, dynamic> toJson() => {
        "item_id": item_id,
        "item_name": item_name,
        "item_price": item_price,
      };

  static ExpenseItem fromJson(Map<String, dynamic> json) {
    return ExpenseItem(
      item_id: json["item_id"],
      item_name: json["item_name"],
      item_price: json["item_price"],
    );
  }
}
