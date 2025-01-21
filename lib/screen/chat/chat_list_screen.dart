import 'package:badboys/screen/chat/chat_list_item_screen.dart';
import 'package:badboys/screen/chat/chat_room_screen.dart';
import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({
    super.key,

  });


  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      body: Container(
        width: maxWidth,
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [

              CustomAppbarScreen(
                isNotification : true,
                isListMenu : false,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text('채팅',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
          
                  Row(
                    children: [
                      Icon(Icons.search,color: Colors.black,size: 30,),
                      Icon(Icons.messenger_outline,color: Colors.black,size: 30,),
                      Icon(Icons.settings,color: Colors.black,size: 30,),
                    ],
                  ),
                ],
              ),
          

          
              for(int i = 0; i< 25; i++)...[
                GestureDetector(
                    onTap: ()=>{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatRoomScreen()),
                      ),
                    },
                    child: ChatListItemScreen(index : i)
                ),
              ]
          
          
            ],
          ),
        ),
      ),
    );
  }
}
