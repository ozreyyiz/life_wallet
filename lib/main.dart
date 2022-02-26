import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:life_wallet/lists/lists.dart';

import 'package:life_wallet/widgets/bottom_navigation_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
