import 'package:flutter/material.dart';
import 'package:life_wallet/db/walletdao.dart';
import 'package:life_wallet/model/wallet.dart';

var wallet = <Wallet>[];
Future<List<Wallet>> getWallet() async {
  wallet = await Walletdao().getWallet();
  return wallet;
}



Container walletBox(Size size) {
  int a=5;
  return Container(
    width: size.width,
    height: size.height / 8,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
        color: Colors.grey),
    child: FutureBuilder(
      future: getWallet(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          var wallets = snapshot.data;
          return ListView.builder(
            itemCount: wallets.length,
            itemBuilder: (BuildContext context, int index) {
              Wallet price = wallets[index];
           
              var pad = size.height / 20;
              return Padding(
                padding: EdgeInsets.all(pad),
                child: Center(child: Text(price.wallet.toString())),
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
