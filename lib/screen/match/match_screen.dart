import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/screen/comn/select_match_info_btn.dart';
import 'package:badboys/subScreen/match/matching_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      color: Colors.black,
      child: Column(
        children: [

          Stack(
            children: [
              Image.asset(
                'assets/images/match.png',
                width: 100.w,
                height: 93.h,
                fit: BoxFit.cover,
              ),
              Container(
                width: 100.w,
                height: 93.h,
                color: Colors.black.withOpacity(0.7),
              ),

              Positioned(
                top: 0,
                  left: 0,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      CustomAppbarScreen(
                        isNotification: false,
                      ),
                    ],
                  )),

              Positioned(
                right: 15,
                left: 15,
                bottom: 20,
                  child: Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setBool("isMatching", false);

                          },
                          child: Container(
                            height: 10.h,
                            child: Text('테스트 임시저장소비우기',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),

                        Container(
                          width: 100.w,
                          height: 7.5.h,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: MatchingButton(regionId : 1),
                        ),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
