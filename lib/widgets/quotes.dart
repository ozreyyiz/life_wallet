import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:life_wallet/lists/lists.dart';

class Quotes extends StatefulWidget {
  const Quotes({ Key? key }) : super(key: key);

  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  @override
  
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedTextKit(isRepeatingAnimation: true,animatedTexts: [
        RotateAnimatedText(quotes[Random().nextInt(3)],duration: Duration(minutes: 1),
        textStyle:TextStyle(fontSize: 40) ),
       
      ],),
    );
  }
}