import 'package:flutter/material.dart';

class ChatListItemScreen extends StatefulWidget {
  const ChatListItemScreen({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<ChatListItemScreen> createState() => _ChatListItemScreenState();
}

class _ChatListItemScreenState extends State<ChatListItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,  // Set the border color
            width: 0.7,           // Set the border width
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(widget.index != 3)
                Container(
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/intro.png',
                      // width: 45,
                      // height: 45,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

              if(widget.index == 3)
                Container(
                  width: 60,
                  child: Wrap(
                    spacing: 1.0, // 아이템 간의 가로 간격
                    runSpacing: 1.0, // 줄 간격
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/testImage1.png',
                          width: 27,
                          height: 27,
                          fit: BoxFit.fill,
                        ),
                      ),
                      ClipOval(
                        child: Image.asset(
                          'assets/images/testImage1.png',
                          width: 27,
                          height: 27,
                          fit: BoxFit.fill,
                        ),
                      ),
                      ClipOval(
                        child: Image.asset(
                          'assets/images/testImage1.png',
                          width: 27,
                          height: 27,
                          fit: BoxFit.fill,
                        ),
                      ),
                      ClipOval(
                        child: Image.asset(
                          'assets/images/testImage1.png',
                          width: 27,
                          height: 27,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),

              SizedBox(width: 7,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '오민규',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.black
                        ),
                      ),
                      Icon(Icons.notifications_off_rounded,color: Colors.grey,size: 15,),
                      Text("5",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Text(
                    '카페갈까??',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey
                    ),
                  )

                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('오후 8:24',style: TextStyle(color: Colors.grey),),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red,
                ),
                child: Center(child: Text('7',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 13),)),
              ),
            ],
          ),



        ],
      ),
    );
  }
}
