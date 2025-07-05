import 'package:badboys/screen/subScreen/comn/appbar/custom_appbar.dart';
import 'package:badboys/screen/subScreen/setting/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomAppbar(
                isNotification: false,
                isBackButton : false
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 100.w,
                    height: 7.5.h,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: LogoutButton()
                ),
              ),
            ),


          ],
        ),
    );
  }
}
