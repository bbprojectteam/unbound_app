import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TeamPlayerListItem extends StatefulWidget {
  const TeamPlayerListItem({super.key});

  @override
  State<TeamPlayerListItem> createState() => _TeamPlayerListItemState();
}

class _TeamPlayerListItemState extends State<TeamPlayerListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/intro.png',
                width: 10.w,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('오민규123',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  Text('2021 pts',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ],
          ),

          Center(
            child: Text(
              '강퇴',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700
              ),
            ),
          )
        ],
      ),
    );
  }
}
