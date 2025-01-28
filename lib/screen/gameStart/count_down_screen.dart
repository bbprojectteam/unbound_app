import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CountDownScreen extends StatefulWidget {
  const CountDownScreen({
    super.key,
  });


  @override
  State<CountDownScreen> createState() => _CountDownScreenState();
}

class _CountDownScreenState extends State<CountDownScreen> {
  @override
  void initState() {
    super.initState();
    // Delay the navigation by 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Get.toNamed('/playingScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: maxWidth,
        height: maxHeight,
        color: Colors.black,
        child: Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/countDown.gif'),
            radius: 60.0, // You can set the radius size for the avatar image
          ),
        ),
      ),
    );
  }
}
