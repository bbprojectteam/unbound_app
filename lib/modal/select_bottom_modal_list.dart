import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectBottomModalList extends StatefulWidget {
  const SelectBottomModalList({
    super.key,
    required this.itemList,
    required this.selectItemIdx,
    required this.callBack,
  });

  final List<dynamic> itemList;
  final int? selectItemIdx;
  final Function callBack;

  @override
  State<SelectBottomModalList> createState() => _SelectBottomModalListState();
}

class _SelectBottomModalListState extends State<SelectBottomModalList> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        for(int i = 0; i < widget.itemList.length; i++)
          GestureDetector(
            onTap: (){
              widget.callBack(i);
            },
            child: Container(
              width: 45.w,
              padding: EdgeInsets.only(top: 15,bottom: 15),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: widget.selectItemIdx == i ? Color(0xff333333) : Colors.black,
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text(
                  '${widget.itemList[i]}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
