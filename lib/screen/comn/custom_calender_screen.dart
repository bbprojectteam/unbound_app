import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCalenderScreen extends StatefulWidget {
  const CustomCalenderScreen({super.key});

  @override
  State<CustomCalenderScreen> createState() => _CustomCalenderScreenState();
}

class _CustomCalenderScreenState extends State<CustomCalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < 10; i++)...[
            Container(
              width: 10.w,
              height: 5.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    '3',
                    style: TextStyle(
                      color: i == 2 ? Colors.white : i==3 ?  Colors.blue : i == 4 ? Colors.red : Colors.white,
                      fontWeight: FontWeight.w800,

                    ),
                  ),
                  Text(
                    '금',
                    style: TextStyle(
                      color: i == 2 ? Colors.white : i==3 ?  Colors.blue : i == 4 ? Colors.red : Colors.white,
                      fontWeight: FontWeight.w800,

                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: 10,
            ),
          ],

        ],
      ),
    );
  }
}
