import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:badboys/screen/comn/select_match_info_btn.dart';
import 'package:badboys/subScreen/home/home_match_btn.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  String defaultMatchSelText = '지역 선택';
  String defaultMatchSelText2 = '동네 선택';

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
                        isListMenu: false,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SelectMatchInfoBtn(title: defaultMatchSelText,listId: 1,callBack : (int? id, String text)=>{
                              defaultMatchSelText= text,
                              setState(() {}),
                            }),
                            SelectMatchInfoBtn(title: defaultMatchSelText2,listId: 2,callBack : (int? id, String text)=>{
                              defaultMatchSelText2= text,
                              setState(() {}),
                            }),
                          ],
                        ),
                        SizedBox(height: 10,),

                        Container(
                          width: 100.w,
                          height: 6.5.h,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: HomeMatchBtn(regionId : 1),
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
