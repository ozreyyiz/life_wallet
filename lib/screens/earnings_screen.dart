import 'package:flutter/material.dart';
import 'package:life_wallet/widgets/bottom_navigation_bar.dart';

class EarningsScreen extends StatefulWidget {
  EarningsScreen({Key? key}) : super(key: key);

  @override
  _EarningsScreenState createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BottomNavigationBarHome(),
        ],
      ),
    );
  }
}
