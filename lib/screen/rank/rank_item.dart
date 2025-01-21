import 'package:flutter/material.dart';

class RankItem extends StatefulWidget {
  const RankItem({
    super.key,
    required this.testRankIdx,
  });

  final int? testRankIdx;

  @override
  State<RankItem> createState() => _RankItemState();
}

class _RankItemState extends State<RankItem> {
  @override
  Widget build(BuildContext context) {

    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;


    return Container(
      padding: EdgeInsets.only(top:5,bottom :5,left: 8,right: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.5), // Set the border color
            width: 1, // Set the border width
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.testRankIdx == 0) ...[
            Flexible(
              flex: 1,
              child: Container(
                child: Image.asset(
                  'assets/images/first_rank.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          if (widget.testRankIdx == 1) ...[
            Flexible(
              flex: 1,
              child: Container(
                child: Image.asset(
                  'assets/images/second_rank.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          if (widget.testRankIdx == 2) ...[
            Flexible(
              flex: 1,
              child: Container(
                child: Image.asset(
                  'assets/images/third_rank.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          if (widget.testRankIdx! >= 3) ...[
            Flexible(
              flex: 1,
              child: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 2,color: Colors.deepPurple)
                ),
                child: Center(
                  child: Text(
                    (widget.testRankIdx! + 1).toString(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
          Flexible(
            flex: 1,
            child: Container(
              child: Center(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/intro.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ),


          Flexible(
            flex: 3,
            child: Container(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "오민규",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "MMR 2042",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),


          Flexible(
            flex: 1,
            child: Container(
              child: Center(
                child: Text(
                  '15',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),

          Flexible(
            flex: 1,
            child: Container(
              child: Center(
                child: Text(
                  '65%',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w700,
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
