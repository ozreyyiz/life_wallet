import 'package:flutter/material.dart';
import 'package:life_wallet/models/lists.dart';
import 'package:life_wallet/screens/home_screen.dart';
import 'package:life_wallet/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Life Wallet',
      home: Scaffold(
        body: Stack(
          children: [
         
            screens[BottomNavigationBarHome().currentIndex],
             
          ],
        ),
      ),
    );
  }
}
