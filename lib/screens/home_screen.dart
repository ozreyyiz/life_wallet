import 'package:flutter/material.dart';
import 'package:life_wallet/widgets/bottom_navigation_bar.dart';
import 'package:life_wallet/widgets/home_screen_main_container.dart';
import 'package:life_wallet/widgets/quotes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeScreenMainContainer(),
          Quotes(),
          BottomNavigationBarHome(),
        ],
      ),
    );
  }
}
