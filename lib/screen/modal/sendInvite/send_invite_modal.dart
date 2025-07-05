import 'package:badboys/controller/member_controller.dart';
import 'package:badboys/screen/subScreen/comn/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class SendInviteModal extends StatefulWidget {
  const SendInviteModal({
    super.key,
    required this.chatRoomId,
    required this.callBack,
  });

  final String chatRoomId;
  final Function callBack;

  @override
  State<SendInviteModal> createState() => _SendInviteModalState();
}

class _SendInviteModalState extends State<SendInviteModal> {

  late MemberController memberController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    memberController = Get.put(MemberController());
    memberController.fnGetInviteMemberList(widget.chatRoomId);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MemberController>(
        init: memberController,
        builder: (matchControllerContext) {




        return Container(
            width: 100.w,
            height: 47.h,
            decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            children: [

              CustomAppbar(
                  isNotification: false,
                  isBackButton : false
              ),

              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Icon(Icons.account_circle)
                        ),

                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("test123",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700
                                  ,fontFamily: 'EHSMB'
                              ),
                            ),
                            Text('1000 pts',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'EHSMB'
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {

                          },
                          child: Center(
                            child: Text(
                              '초대하기',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'EHSMB'
                              ),
                            ),
                          ),
                        ),


                      ],
                    )
                  ],
                ),
              )

            ],
          ),
        );
      }
    );
  }
}
