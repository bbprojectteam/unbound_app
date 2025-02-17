import 'package:badboys/modal/select_bottom_modal_list.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectBottomModalScreen extends StatefulWidget {
  const SelectBottomModalScreen({
    super.key,
    required this.selectItemIdx,
    required this.selectItemList,
    required this.callBack,
  });

  final int? selectItemIdx;
  final List<dynamic> selectItemList;
  final Function callBack;
  @override
  State<SelectBottomModalScreen> createState() =>
      _SelectBottomModalScreenState();
}

class _SelectBottomModalScreenState
    extends State<SelectBottomModalScreen> {

  late int? itemIdx;

  @override
  void initState() {
    // TODO: implement initState
    itemIdx = widget.selectItemIdx;

    super.initState();
  }



  @override
  Widget build(BuildContext context) {



    return Container(
      width: 100.w,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.w,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Set the border color
                  width: 1, // Set the border width
                ),
              ),
            ),
            child: Text(
              'Unbound',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          SizedBox(height: 20,),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: 96.w,
                height: 25.5.h,
                child: SelectBottomModalList(
                  itemList : widget.selectItemList,
                  selectItemIdx : itemIdx,
                  callBack: (selectItemIdx){
                    itemIdx = selectItemIdx;
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: ()=>{
              print(itemIdx),
              print(widget.selectItemList[itemIdx!]),
              widget.callBack(itemIdx,widget.selectItemList[itemIdx!]),
              Navigator.pop(context),
            },
            child: Container(
              height: 6.h,
              width: 96.w,
              decoration: BoxDecoration(
                color: Color(0x33ffffff),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text(
                  '선택 완료',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
