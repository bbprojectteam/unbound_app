import 'package:badboys/controller/match_controller.dart';
import 'package:badboys/model/match/match_info_model.dart';
import 'package:badboys/model/match/match_model.dart';
import 'package:badboys/router/app_bottom_modal_router.dart';
import 'package:badboys/screen/appScreen/info/member_page_screen.dart';
import 'package:badboys/screen/subScreen/comn/cachedNetworkImage/custom_cached_network_image.dart';
import 'package:badboys/screen/subScreen/comn/loadingBar/custom_progress_Indicator_item.dart';
import 'package:badboys/screen/subScreen/lockerRoom/lockerRoom/match_point_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LockerRoomInfo extends StatefulWidget {
  const LockerRoomInfo({
    super.key,
    required this.chatRoomId,
  });

  final String chatRoomId;

  @override
  State<LockerRoomInfo> createState() => _LockerRoomInfoState();
}

class _LockerRoomInfoState extends State<LockerRoomInfo> {

  late MatchController matchController;
  late MatchModel matchModel;

  bool _showMap = true;
  double? _prevLat;
  double? _prevLng;

  void _checkCoordinateChange(double? lat, double? lng) {
    if (_prevLat != lat || _prevLng != lng) {
      _prevLat = lat;
      _prevLng = lng;


      WidgetsBinding.instance.addPostFrameCallback((_) {

        _showMap = false;
        setState(() {});

        Future.delayed(Duration(milliseconds: 600), () {
          _showMap = true;
          setState(() {});
        });
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.lazyPut<MatchController>(() => MatchController());
    matchController = Get.find<MatchController>();

    if (!matchController.isApiCalled.value) {  // 아직 호출되지 않았다면
      matchController.isApiCalled.value = true;
      matchController.fnMatchInfo(widget.chatRoomId);
    }
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MatchController>(
      init: matchController,
      builder: (context) {

        matchModel = matchController.matchModel;

        _checkCoordinateChange(matchModel.matchInfoModel?.latitude, matchModel.matchInfoModel?.longitude);

        return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 90.w,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                (_showMap && matchModel.matchInfoModel?.latitude != null && matchModel.matchInfoModel?.longitude != null)
                    ? KakaoMapView(
                        width: 100.w,
                        height: 23.h,
                        kakaoMapKey: dotenv.get("KAKAO_JAVASCRIPT_KEY"),
                        lat: matchModel.matchInfoModel?.latitude ?? 0.0,
                        lng: matchModel.matchInfoModel?.longitude ?? 0.0,
                        zoomLevel: 1,
                        draggableMarker: false,
                        showMapTypeControl: false,
                        showZoomControl: true,
                        markerImageURL: 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
                      )
                    : (matchModel.matchInfoModel?.latitude != null && matchModel.matchInfoModel?.longitude != null)
                    ? Container(
                        width: 100.w,
                        height: 23.h,
                        color: Colors.black54,
                        child: Center(child: CustomProgressIndicatorItem()),
                      ) : Container(
                        width: 100.w,
                        height: 23.h,
                        color: Colors.black54,
                        child: Center(
                          child: Text("지정된 주소가 없습니다.",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600,letterSpacing: -0.3,color: Colors.grey,fontFamily: 'EHSMB'),),
                        ),
                      ),



                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(matchModel.matchInfoModel?.matchDt ?? '선택된 날짜가 없습니다.',style: TextStyle(fontWeight: FontWeight.w800,letterSpacing: -0.3,color: Colors.orange,fontFamily: 'EHSMB'),),
                          Text(matchModel.matchInfoModel?.name ?? "새 라커룸",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,letterSpacing: -0.3,color: Colors.white,fontFamily: 'EHSMB'),),

                          Row(
                            children: [
                              Text(
                                matchModel.matchInfoModel?.location ?? '지정된 주소가 없습니다.',
                                style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: -0.3,color: Colors.grey,fontFamily: 'EHSMB'),),

                              SizedBox(width: 3,),
                              Row(
                                children: [
                                  Icon(Icons.copyright_outlined,size: 18,),
                                ],
                              ),
                              SizedBox(width: 3,),
                              Icon(Icons.map_outlined,size: 18),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),

                    Container(
                      width: 95.w,
                      height: 4.7.h,
                      margin: EdgeInsets.only(left: 10,),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2.3,color: Colors.orange)
                      ),
                      child: Text(
                          matchModel.matchInfoModel?.description?.trim().isNotEmpty == true
                              ? matchModel.matchInfoModel!.description! : "메모가 없습니다.",

                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'EHSMB'

                        ),
                      ),
                    ),

                    SizedBox(height: 5,),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('현재 참여자',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white,fontFamily: 'EHSMB'),),
                          SizedBox(height: 5,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  for (int i = 0; i < matchModel.matchMemberModel.length; i++)...[
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              Get.toNamed(
                                                  '/memberPageScreen',
                                                  arguments: {'tab' : 0, 'memberId' : matchModel.matchMemberModel[i].userId }
                                              );
                                            },
                                            child: ClipOval(
                                              child: CustomCachedNetworkImage(
                                                  imagePath: matchModel.matchMemberModel[i].profileImage.toString(),
                                                  imageWidth: 10.w,
                                                  imageHeight: null
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 3,),
                                          Text(
                                              matchModel.matchMemberModel[i].role.toString() == "OWNER" ? '방장' :'',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontFamily: 'EHSMB'
                                            ),
                                          ),
                                        ],
                                      ),

                                  ]

                                ],
                              ),

                              if(!matchModel.isJoinLockerRoom!)
                                GestureDetector(
                                  onTap: () async {
                                      await matchController.fnMatchJoin(widget.chatRoomId);
                                    },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(width: 1,color: Colors.orange),
                                        color: Colors.orange
                                    ),
                                    child: Text('참여',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 15,letterSpacing: -0.3,fontFamily: 'EHSMB'),),
                                  ),
                                ),

                              if(matchModel.isJoinLockerRoom!)
                                GestureDetector(
                                  onTap: () async {
                                    await matchController.fnMatchExit(widget.chatRoomId);
                                    Get.toNamed('/');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(width: 1,color: Colors.grey),
                                        color: Colors.grey
                                    ),
                                    child: Text('나가기',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 15,letterSpacing: -0.3,fontFamily: 'EHSMB'),),
                                  ),
                                ),

                            ],
                          ),

                        ],
                      ),
                    ),


                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '매치포인트',
                              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700,color: Colors.white,fontFamily: 'EHSMB'),
                            ),
                          ),

                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MatchPointItem(
                                  matchPointText: '3 vs 3',
                                  matchPointEditStatusYn: matchModel.matchInfoModel?.threeOnThreeYn == null ? 'N' : matchModel.matchInfoModel!.threeOnThreeYn!,
                                  containerWidth: 43.w

                              ),


                              MatchPointItem(
                                  matchPointText: '농구공',
                                  matchPointEditStatusYn: matchModel.matchInfoModel?.ballYn == null ? 'N' : matchModel.matchInfoModel!.ballYn!,
                                  containerWidth: 43.w),
                            ],
                          ),
                          SizedBox(height: 25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              MatchPointItem(
                                  matchPointText: '백보드',
                                  matchPointEditStatusYn: matchModel.matchInfoModel?.backBoardYn == null ? 'N' : matchModel.matchInfoModel!.backBoardYn!,
                                  containerWidth: 25.w),

                              MatchPointItem(
                                  matchPointText: '3점 라인 제한',
                                  matchPointEditStatusYn: matchModel.matchInfoModel?.threePointLimitYn == null ? 'N' : matchModel.matchInfoModel!.threePointLimitYn!,
                                  containerWidth: 35.w),

                              MatchPointItem(
                                  matchPointText: '심판',
                                  matchPointEditStatusYn: matchModel.matchInfoModel?.refereeYn == null ? 'N' : matchModel.matchInfoModel!.refereeYn!,
                                  containerWidth: 30.w),


                            ],
                          ),

                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              MatchPointItem(
                                  matchPointText: '하프코트',
                                  matchPointEditStatusYn: matchModel.matchInfoModel?.halfCourtYn == null ? 'N' : matchModel.matchInfoModel!.halfCourtYn!,
                                  containerWidth: 43.w),

                              MatchPointItem(
                                  matchPointText: '풀코트',
                                  matchPointEditStatusYn: matchModel.matchInfoModel?.halfCourtYn == null ? 'N' : matchModel.matchInfoModel!.halfCourtYn == 'Y' ? 'N' : 'Y',
                                  containerWidth: 43.w),

                            ],
                          ),
                          SizedBox(height: 10,),




                        ],
                      ),
                    ),





                    SizedBox(height: 15,),
                    Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.withOpacity(0.8),
                            width: 1,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 10,top :30 ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('■ 냉방시설 구비', style: TextStyle(color: Colors.white),),
                          SizedBox(height: 8,),
                          Text("■ 흡연: 건물 전체 금연 구역\n*건물 밖으로 나가셔서 오른쪽으로 조금 걸어가시면 흡연 구역 위치\n *1층 출입구 앞 흡연 불가\n*건물 내 흡연 적발 시 과태료 10만원 부과 및 강제 퇴실 조치",style: TextStyle(color: Colors.white),),
                          SizedBox(height: 8,),
                          Text('■ 찾아가는 길: 테니스 장 건물 4층(다이소 창동3호점 뒷 건물)',style: TextStyle(color: Colors.white),),
                          SizedBox(height: 8,),
                          Text('■ 주차: 다이소 창동 3점 주차장 이용, 지하 주차장 이용 불가\n- 구장에 비치된 태블릿으로 차량번호 등록 (2시간 500원 / 3시간 1,000원)',style: TextStyle(color: Colors.white),),
                          SizedBox(height: 8,),
                          Text('■ 대여/판매\n- 풋살화 대여: 3,000원 / 230~285 사이즈 보유\n- 물: 500원 / 음료 1,500원',style: TextStyle(color: Colors.white),),

                        ],
                      ),
                    ),
                  ],
                ),



              ],
            ),
          );
      }
    );
  }
}
