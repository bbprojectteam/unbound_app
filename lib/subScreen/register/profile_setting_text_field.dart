import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileSettingTextField extends StatefulWidget {
  const ProfileSettingTextField({
    super.key,
    required this.labelText,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;
  final String labelText;
  @override
  State<ProfileSettingTextField> createState() => _ProfileSettingTextFieldState();
}

class _ProfileSettingTextFieldState extends State<ProfileSettingTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1,color: Colors.white)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 16.w,
            color: Colors.black,
            child: Center(
              child: Text(
                widget.labelText,
                style:TextStyle(color: Colors.white),),
            ),
          ),
          Container(
            width: 78.w,
            child: TextField(
              controller: widget.textEditingController,
              decoration: InputDecoration(
                // Label 스타일
                labelText: '',
                labelStyle: TextStyle(
                  color: Colors.white, // 라벨 텍스트 색상
                  fontSize: 16,
                ),
                // 텍스트 필드 꾸미기
                filled: true, // 배경색을 채움
                fillColor: Colors.white, // 입력 필드 배경색
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // 둥근 모서리
                  borderSide: BorderSide(
                    color: Colors.white, // 경계선 색상 (기본 화이트)
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.white, // 기본 경계선 색상
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.white, // 포커스가 있을 때 경계선 색상
                    width: 2,
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.black, // 입력 텍스트 색상 (검정색)
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
