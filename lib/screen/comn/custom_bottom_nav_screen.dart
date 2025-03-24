// lib/widgets/CustomBottomNavScreen.dart

import 'package:flutter/material.dart';

class CustomBottomNavScreen extends StatelessWidget {
  final IconData icon;
  final String label;
  final double wSize;
  final bool isSelected;
  final Function onTap;

  // 생성자에서 아이콘, 텍스트, 선택 여부 및 onTap을 받음
  CustomBottomNavScreen({
    required this.icon,
    required this.label,
    required this.wSize,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wSize,
      child: GestureDetector(
        onTap: () => onTap(), // 탭 시 onTap 호출
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
              size: 30,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.grey,
                  fontFamily: 'EHSMB'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
