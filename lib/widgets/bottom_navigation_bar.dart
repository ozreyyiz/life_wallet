import 'package:flutter/material.dart';
import 'package:life_wallet/screens/earnable/earning_screen_add.dart';
import 'package:life_wallet/screens/earnable/earnings_screen.dart';
import 'package:life_wallet/screens/sellable/selling_screen.dart';
import 'package:life_wallet/screens/home_screen.dart';
import 'package:life_wallet/screens/sellable/selling_screen_add.dart';
import 'package:life_wallet/widgets/my_painter.dart';

class BottomNavigationBarHome extends StatefulWidget {
  int currentIndex;
  BottomNavigationBarHome({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  _BottomNavigationBarHomeState createState() =>
      _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      child: SizedBox(
        width: size.width,
        height: 80,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: MyPainter(),
            ),
            Center(
                heightFactor: 0.6,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => widget.currentIndex == 1
                                    ? EarningItemAdd()
                                    : SellingItemAdd()));
                      });
                    },
                    child: CircleAvatar(
                      radius: 30,
                    ))),
            SizedBox(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EarningsScreen()));
                      });
                    },
                    icon: Icon(
                      Icons.access_alarms_outlined,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    width: size.width / 8,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SellingScreen()));
                      });
                    },
                    icon: Icon(
                      Icons.access_alarms_outlined,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
