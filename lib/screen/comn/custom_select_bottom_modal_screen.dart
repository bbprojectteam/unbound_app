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
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.w,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,  // Set the border color
                  width: 1,           // Set the border width
                ),
              ),
            ),
            child: Text(
              'Unbound',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          // SingleChildScrollView를 Expanded로 감싸서 스크롤 영역을 확보
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('12123',style: TextStyle(color: Colors.white),),
                      Text('12123',style: TextStyle(color: Colors.white),),

                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
