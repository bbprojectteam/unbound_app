import 'package:badboys/screen/modalPop/team_chng_modal_pop.dart';
import 'package:badboys/screen/rank/rank_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      color: Colors.white,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap : () {
              print('123123');
            },
            child: Icon(
              Icons.account_circle_sharp,
              color: Colors.black,
              size: 30,
            ),
          ),
          Text('언바운드',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 20,
              fontStyle: FontStyle.italic
            ),
          ),

          Row(
            children: [
              GestureDetector(
                onTap: ()=>{
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RankScreen()),
                  ),
                },
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/chart.svg',
                    width: 27,
                    height: 27,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 9),

              if(widget.isNotification)
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.notifications_none,
                    size: 25,
                  ),
                ),

              if(widget.isListMenu)
                GestureDetector(
                  onTap: ()=>{
                  _showDropdownMenu(context),
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.menu_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
            ],
          ),
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
