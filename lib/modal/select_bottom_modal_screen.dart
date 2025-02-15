import 'package:badboys/modal/select_bottom_modal_list.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectBottomModalScreen extends StatefulWidget {
  const SelectBottomModalScreen({
    super.key,
    required this.firstSelectIdx,
    required this.secondSelectIdx,
    required this.firstItemList,
    required this.secondItemList,
  });

  final int? firstSelectIdx;
  final int? secondSelectIdx;
  final List<dynamic> firstItemList;
  final List<dynamic> secondItemList;

  @override
  State<SelectBottomModalScreen> createState() =>
      _SelectBottomModalScreenState();
}

class _SelectBottomModalScreenState
    extends State<SelectBottomModalScreen> {

  late int? firstIdx;
  late int? secondIdx;

  @override
  void initState() {
    // TODO: implement initState
    firstIdx = widget.firstSelectIdx;
    secondIdx = widget.secondSelectIdx;

    super.initState();
  }



  @override
  Widget build(BuildContext context) {



    return Container(
      width: 100.w,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(widget.firstSelectIdx != null)
                  SingleChildScrollView(
                    child: SelectBottomModalList(
                        itemList : widget.firstItemList,
                        selectItemIdx : firstIdx,
                        callBack: (selectItemIdx){
                            firstIdx = selectItemIdx;
                            setState(() {});
                        },
                    ),
                  ),
                if(widget.secondSelectIdx != null)
                  SingleChildScrollView(
                    child: SelectBottomModalList(
                      itemList: widget.secondItemList,
                      selectItemIdx : secondIdx,
                      callBack: (selectItemIdx){
                        secondIdx = selectItemIdx;
                        setState(() {});
                      },
                    ),
                  ),


              ],
            ),
          ),

        ],
      ),
    );
  }
}
