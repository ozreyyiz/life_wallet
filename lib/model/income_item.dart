class IncomeItem {
   String item_id;
  final String item_name;
  final String item_price;

  IncomeItem({
    this.item_id="",
    required this.item_name,
    required this.item_price,
  });

  Map<String, dynamic> toJson() => {
        "item_id": item_id,
        "item_name": item_name,
        "item_price": item_price,
      };

  static IncomeItem fromJson(Map<String, dynamic> json) {
    return IncomeItem(
      item_id: json["item_id"],
      item_name: json["item_name"],
      item_price: json["item_price"],
    );
  }
}
