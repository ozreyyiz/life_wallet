import 'package:flutter/material.dart';
import 'package:life_wallet/widgets/bottom_navigation_bar.dart';

class BuyScreen extends StatefulWidget {
  BuyScreen({Key? key}) : super(key: key);

  @override
  _BuyScreenState createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [
        BottomNavigationBarHome(),
    ],),);
  }
}