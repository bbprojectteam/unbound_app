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
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(); // FocusNode를 초기화
  }

  @override
  void dispose() {
    _focusNode.dispose(); // FocusNode를 dispose
    super.dispose();
  }

  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    // 포커스 상태 업데이트
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: widget.textEditingController,
        focusNode: _focusNode, // FocusNode 연결
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: widget.textEditingController.text.isNotEmpty
                ? Colors.orange
                : Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1.5), // 기본 테두리 굵기
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange, width: 1.5), // 포커스된 상태에서 테두리 굵기
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: widget.textEditingController.text.isNotEmpty || _hasFocus
                  ? Colors.orange
                  : Colors.grey,
              width: 1.5,
            ), // 텍스트가 있거나 포커스가 있을 때 오렌지색
          ),
        ),
      ),
    );
  }
}
