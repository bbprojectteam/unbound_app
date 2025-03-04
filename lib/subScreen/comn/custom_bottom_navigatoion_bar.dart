import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.5.h, // 네비게이션 바 높이
      decoration: BoxDecoration(
        color: Colors.black, // 배경색
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildNavItem('assets/images/basketball.svg', 'Unbound', 0,34.w),
          _buildNavItem('assets/images/spinner.svg', 'Match', 1,33.w),
          _buildNavItem('assets/images/setting.svg', 'Setting', 2,33.w),
        ],
      ),
    );
  }

  Widget _buildNavItem(String iconUri, String label, int index, double width) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: width,
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconUri,
                width: 3.w,
                height: 3.h,
                color: Colors.orange,
              ),

              SizedBox(
                width: 5,
              ),
              Text(
                label,
                style: TextStyle(
                    color: !isSelected ? Colors.grey : Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 17),
              ),
            ]),
      ),
    );
  }
}
