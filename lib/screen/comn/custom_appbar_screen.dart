import 'package:badboys/screen/modalPop/team_chng_modal_pop.dart';
import 'package:badboys/screen/rank/rank_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAppbarScreen extends StatefulWidget {
  const CustomAppbarScreen({
    super.key,
    required this.isNotification,
    required this.isListMenu,
  });

  final bool isNotification;
  final bool isListMenu;

  @override
  State<CustomAppbarScreen> createState() => _CustomAppbarScreenState();
}

class _CustomAppbarScreenState extends State<CustomAppbarScreen> {
  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      color: Colors.black,
      width: 100.w,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            'Unbound',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 20,
              fontStyle: FontStyle.italic
            ),
          ),

          // Row(
          //   children: [
          //     if(widget.isNotification)
          //       Container(
          //         padding: EdgeInsets.all(3),
          //         decoration: BoxDecoration(
          //           color: Colors.black,
          //           borderRadius: BorderRadius.circular(100),
          //         ),
          //         child: Icon(
          //           Icons.notifications_none,
          //           color: Colors.white,
          //           size: 25,
          //         ),
          //       ),
          //
          //     if(widget.isListMenu)
          //       GestureDetector(
          //         onTap: ()=>{
          //         _showDropdownMenu(context),
          //         },
          //         child: Container(
          //           padding: EdgeInsets.all(3),
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(100),
          //           ),
          //           child: Icon(
          //             Icons.menu_outlined,
          //             color: Colors.black,
          //             size: 25,
          //           ),
          //         ),
          //       ),
          //   ],
          // ),

        ],
      ),
    );
  }

  void _showDropdownMenu(BuildContext context) async {

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(50, 70, 0, 0), // 드롭다운 위치
      items: [
        PopupMenuItem<int>(
          value: 1,
          child: Text('투표하기'),
        ),
        PopupMenuItem<int>(
          value: 200,
          child: Text('팀변경'),
        ),
        PopupMenuItem<int>(
          value: 300,
          child: Text('경기시작'),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {

        if (value == 200) {
          showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return Dialog(
                child: TeamChngModalPop(),
              );
            },
          );
        } else if(value == 300){

          // widget.fnRouter(6);

        }



        // widget.fnRouter(value);



      }
    });
  }

}
