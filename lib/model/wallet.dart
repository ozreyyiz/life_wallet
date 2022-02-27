import 'dart:convert';

class Wallet {
  String id;
  final int wallet;

  Wallet({
    this.id = "",
    required this.wallet,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "wallet_amount": wallet,
      };

  static Wallet fromJson(Map<String, dynamic> json) {
    return Wallet(
      wallet: json["wallet_amount"],
      id: json["id"],
    );
  }
}
