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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: widget.textEditingController,
        // obscureText: ,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
