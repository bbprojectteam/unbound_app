import 'package:flutter/material.dart';

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
    Item(top: 40, left: 70, right: 0),
    Item(top: 90, left: 110, right: 0),
    Item(top: 150, left: 70, right: 0),

    Item(top: 40, left: 0, right: 70),
    Item(top: 90, left: 0, right: 110),
    Item(top: 150, left: 0, right: 70),
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
      height: maxHeight * 0.6,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
            color: Colors.deepPurple,
            child: Text(
              '팀 변경',
              style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.white),
            ),
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/testCourt2.jpg',
                fit: BoxFit.fill,
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
                      child: Icon(
                        Icons.account_circle_sharp,
                        size: 40,
                        color: i == 0 ? Colors.red : Colors.blue,
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
              width: 50,
              height: 30,
              color: Colors.black,
              child: Center(
                child: Text(
                  '완료',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
