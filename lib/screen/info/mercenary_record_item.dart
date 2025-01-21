import 'package:flutter/material.dart';

class MercenaryRecordItem extends StatefulWidget {
  const MercenaryRecordItem({super.key});

  @override
  State<MercenaryRecordItem> createState() => _MercenaryRecordItemState();
}

class _MercenaryRecordItemState extends State<MercenaryRecordItem> {
  @override
  Widget build(BuildContext context) {

    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;




    return Container(
      width: maxWidth * 0.95,
      height: maxHeight * 0.1,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                child: Image.asset(
                  'assets/images/testCourt.png',

                  fit: BoxFit.cover,
                ),
              ),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_circle_sharp,size: 18,),
                        Text('윈터,카리나,오민규,민지,나연'),
                      ],
                    ),

                    Text('대전 탄방동 KAIST 농구장'),
                    Text('정보추가필요'),
                  ],
                ),
              ),
            ],
          ),


          Container(
            child: Center(
              child: Text('승'),
            ),
          ),

        ],
      ),
    );
  }
}
