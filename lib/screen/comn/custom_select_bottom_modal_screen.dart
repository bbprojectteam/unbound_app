import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomSelectBottomModalScreen extends StatefulWidget {
  const CustomSelectBottomModalScreen({super.key});

  @override
  State<CustomSelectBottomModalScreen> createState() => _CustomSelectBottomModalScreenState();
}

class _CustomSelectBottomModalScreenState extends State<CustomSelectBottomModalScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 50.h,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,  // Set the border color
                  width: 1,           // Set the border width
                ),
              ),
            ),
            child: Text(
              '지역 선택',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),


          






        ],
      ),
    );
  }
}
