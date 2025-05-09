import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/model/member/user_info.dart';
import 'package:badboys/screen/subScreen/comn/custom_cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserProfileContainer extends StatefulWidget {
  const UserProfileContainer({super.key});

  @override
  State<UserProfileContainer> createState() => _UserProfileContainerState();
}

class _UserProfileContainerState extends State<UserProfileContainer> {
  late MemberController memberController;
  late UserInfo memberModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    memberController = Get.put(MemberController());
    memberController.fnGetProfileInfo();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<MemberController>(
        init: memberController,
        builder: (context) {

         memberModel = memberController.memberModel;

          return Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if(memberModel.profileImage != null)
                        ClipOval(
                          child: CustomCachedNetworkImage(
                              imagePath: memberModel.profileImage.toString(),
                              imageWidth: 10.w,
                              imageHeight: null
                          ),
                        ),

                        SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(memberModel.username ?? "null",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                                fontFamily: 'EHSMB'
                            ),
                          ),
                          Text(memberModel.regionNm ?? "null",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                                fontFamily: 'EHSMB'
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),

                  Row(
                    children: [
                      Image.asset(
                        'assets/images/color_world.png',
                        width: 5.w,
                        height: 2.h,
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 7,),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text( (memberModel.mmr ?? '0').toString() + ' pts',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                  fontFamily: 'EHSMB'
                              ),
                            ),
                          ]
                      ),
                    ],
                  ),
                ],
              ),
            );
        }
      ),

    );
  }
}