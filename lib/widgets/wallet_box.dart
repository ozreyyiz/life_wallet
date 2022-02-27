import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:life_wallet/model/wallet.dart';

var walletAmount;

Stream<List<Wallet>> getWallet() {
  return FirebaseFirestore.instance.collection("wallet").snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => Wallet.fromJson(doc.data())).toList());
}

Container walletBox(Size size) {
  return Container(
    width: size.width,
    height: size.height / 8,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
        color: Colors.grey),
    child: StreamBuilder(
      stream: getWallet(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          var wallets = snapshot.data;

          return ListView.builder(
            itemCount: wallets.length,
            itemBuilder: (BuildContext context, int index) {
              Wallet price = wallets[index];
              walletAmount = price.wallet;
              var pad = size.height / 20;
              return Padding(
                padding: EdgeInsets.all(pad),
                child: Center(
                  child: Text(
                    price.wallet.toString(),
                  ),
                ),
              );
            },
          );
        } else {
          return Center();
        }
      },
    ),
  );
}
