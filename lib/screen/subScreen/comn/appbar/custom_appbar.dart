
import 'package:badboys/controller/auth_controller.dart';
import 'package:badboys/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({
    super.key,
    required this.isBackButton,
    required this.isNotification,
  });

  final bool isBackButton;
  final bool isNotification;

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      color: Colors.transparent,
      width: 100.w,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.isBackButton)
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 23,
                  ),
                ),

              SizedBox(width: 10,),

              Text(
                'Unbound',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'EHSMB'
                ),
              ),
            ],
          ),

          Row(
            children: [
              // if(widget.isNotification)
              //   GestureDetector(
              //     onTap: (){
              //       Get.toNamed("/notification");
              //     },
              //     child: Container(
              //       padding: EdgeInsets.all(3),
              //       decoration: BoxDecoration(
              //         color: Colors.black,
              //         borderRadius: BorderRadius.circular(100),
              //       ),
              //       child: Icon(
              //         Icons.notifications_none,
              //         color: Colors.white,
              //         size: 25,
              //       ),
              //     ),
              //   ),

            ],
          ),

        ],
      ),
    );
  }


}
