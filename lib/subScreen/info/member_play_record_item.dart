import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MemberPlayRecordItem extends StatefulWidget {
  const MemberPlayRecordItem({
    super.key,
    required this.isWin,
  });

  final bool isWin;

  @override
  State<MemberPlayRecordItem> createState() => _MemberPlayRecordItemState();
}

class _MemberPlayRecordItemState extends State<MemberPlayRecordItem> {
  @override
  Widget build(BuildContext context) {

    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;




    return Container(
      width: maxWidth * 0.95,
      height: maxHeight * 0.12,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.isWin ? "+26" : "-13",
                style: TextStyle(
                  color: widget.isWin ? Colors.red : Colors.blueAccent,
                  fontSize: 25
                ),
              ),
              SizedBox(width: 10,),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('대전 탄방동 KAIST 농구장',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.account_circle_sharp,color: Colors.white,size: 30,),
                            Icon(Icons.account_circle_sharp,color: Colors.red,size: 30),
                            Icon(Icons.account_circle_sharp,color: Colors.blue,size: 30),
                            Icon(Icons.account_circle_sharp,color: Colors.purpleAccent,size: 30),
                            Icon(Icons.account_circle_sharp,color: Colors.green,size: 30),
                          ],
                        ),
                        
                      ],
                    ),

                    Text('2025-01-28',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),


          GestureDetector(
            onTap: ()=>{
              Get.toNamed('/playInfo')
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1,color: Colors.white),
                  color: Colors.white
              ),
              child: Text('상세보기',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 15,letterSpacing: -0.3),),
            ),
          ),

        ],
      ),
    );
  }
}
