import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Item {
  double top;
  double left;
  double right;

  Item({required this.top, required this.left, required this.right});
}

class TeamChngModalPop extends StatefulWidget {
  const TeamChngModalPop({super.key});

  @override
  State<TeamChngModalPop> createState() => _TeamChngModalPopState();
}

class _TeamChngModalPopState extends State<TeamChngModalPop> {
  List<Item> items = [
    Item(top: 70, left: 40, right: 0),
    Item(top: 120, left: 80, right: 0),
    Item(top: 180, left: 40, right: 0),

    Item(top: 70, left: 230, right: 0),
    Item(top: 120, left: 180, right: 0),
    Item(top: 180, left: 230, right: 0),
  ];

  int? selectedItemIndex;

  void _swapPositions(int firstIndex, int secondIndex) {
    setState(() {
      Item temp = items[firstIndex - 1];
      items[firstIndex - 1] = items[secondIndex - 1];
      items[secondIndex - 1] = temp;
    });
  }

  void _onItemTap(int itemIndex) {
    setState(() {
      if (selectedItemIndex == null) {
        selectedItemIndex = itemIndex;
        print(selectedItemIndex);
      } else if (selectedItemIndex != itemIndex) {
        _swapPositions(selectedItemIndex!, itemIndex);
        selectedItemIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;




    return Container(
      width: maxWidth,
      height: maxHeight * 0.47,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15)
    ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbarScreen(isNotification: false, isListMenu: false),
          Stack(
            children: [
              Image.asset(
                'assets/images/court.png',
                // fit: BoxFit.fill,
                width: 100.w,
                height: 34.h,
              ),
              for (int i = 0; i < items.length; i++)
                AnimatedPositioned(
                  top: items[i].top,
                  left: items[i].left != 0 ? items[i].left : null,
                  right: items[i].right != 0 ? items[i].right : null,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: GestureDetector(
                    onTap: () {
                      _onItemTap(i + 1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: (i + 1) == selectedItemIndex ? Colors.red : Colors.white, width: 3),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/intro.png',
                          width: 13.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),

          GestureDetector(
            onTap: ()=>{
              Navigator.pop(context)
            },
            child: Container(
              width: 100.w,
              height: 5.h,
              color: Colors.black,
              child: Center(
                child: Text(
                  '변경 완료',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
