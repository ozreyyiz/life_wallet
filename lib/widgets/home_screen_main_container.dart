import 'package:flutter/material.dart';

class HomeScreenMainContainer extends StatefulWidget {
  const HomeScreenMainContainer({Key? key}) : super(key: key);

  @override
  _HomeScreenMainContainerState createState() =>
      _HomeScreenMainContainerState();
}

class _HomeScreenMainContainerState extends State<HomeScreenMainContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height,
          width: size.width,
          color: Colors.blue,
          child: Opacity(
            opacity: 0.5,
            child: Image.network(
              "https://images.pexels.com/photos/4941610/pexels-photo-4941610.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
