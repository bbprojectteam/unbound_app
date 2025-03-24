import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeMenuBtn extends StatelessWidget {
  const HomeMenuBtn({
    super.key,
    required this.icon,
    required this.imagePath,
    required this.title,
    required this.iconWSize,
    required this.iconHSize,
    required this.uri,
    required this.arguments,
  });

  final IconData? icon;
  final String? imagePath;
  final String title;
  final double iconWSize;
  final double iconHSize;
  final String? uri;
  final Map<String,dynamic> arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 8.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orange,width: 1.5)
      ),
      child: GestureDetector(
        onTap: ()=>{
          Get.toNamed(uri!,
            arguments: arguments,
          )
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            if(icon != null)
              Icon(icon,),

            if(imagePath != null)
              Image.asset(
                imagePath!,
                width: iconWSize,
                height: iconHSize,
                color: Colors.orange,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 10,),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'EHSMB'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
