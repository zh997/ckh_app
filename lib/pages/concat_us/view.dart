import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';


class ConcatUsPage extends StatefulWidget {
  @override
  _ConcatUsPageState createState() => _ConcatUsPageState();
}

class _ConcatUsPageState extends State<ConcatUsPage> {
  final ConcatUsLogic logic = Get.put(ConcatUsLogic());
  final ConcatUsState state = Get.find<ConcatUsLogic>().state;
  // BMFMapOptions mapOptions = BMFMapOptions(
  //     zoomLevel: 12,
  //     mapPadding: BMFEdgeInsets(left: 30, top: 0, right: 30, bottom: 0));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  // void onBMFMapCreated(BMFMapController _bmfMapController)  {
  //   _bmfMapController?.showUserLocation(true);
  //   BMFCoordinate coordinate = BMFCoordinate(114.113625,22.601491);
  //
  //   BMFLocation location = BMFLocation(
  //       coordinate: coordinate,
  //       altitude: 0,
  //       horizontalAccuracy: 5,
  //       verticalAccuracy: -1.0,
  //       speed: -1.0,
  //       course: -1.0);
  //
  //   BMFUserLocation userLocation = BMFUserLocation(
  //     location: location,
  //   );
  //
  //   BMFUserLocationDisplayParam displayParam = BMFUserLocationDisplayParam(
  //       locationViewOffsetX: 0,
  //       locationViewOffsetY: 0,
  //       accuracyCircleFillColor: Colors.red,
  //       accuracyCircleStrokeColor: Colors.blue,
  //       isAccuracyCircleShow: true,
  //       // locationViewImage: 'resoures/animation_red.png',
  //       locationViewHierarchy:
  //       BMFLocationViewHierarchy.LOCATION_VIEW_HIERARCHY_BOTTOM);
  //
  //   _bmfMapController?.updateLocationData(userLocation);
  //   _bmfMapController?.updateLocationViewWithParam(displayParam);
  //
  //   // // ??????????????????
  //   // BMFPoiCitySearchOption poiCitySearchOption =
  //   // BMFPoiCitySearchOption(city: '??????', keyword: '?????????????????????????????????????????????B?????????');
  //   // // ????????????
  //   // BMFPoiCitySearch poiCitySearch = BMFPoiCitySearch();
  //   // // ????????????
  //   // poiCitySearch.onGetPoiCitySearchResult(callback: (BMFPoiSearchResult result, BMFSearchErrorCode errorCode) {
  //   //   print('poi?????????????????? errorCode = ${errorCode}  \n result = ${result?.toMap()}');
  //   //   // ??????reslut???????????????demo
  //   // });
  //   // // ????????????
  //   // bool flag = await poiCitySearch.poiCitySearch(poiCitySearchOption);
  //   // _bmfMapController.getShowMapPoi();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.COLOR_F5F6FA,
      appBar: AppBar(leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_rounded, size: 25, color: AppColors.COLOR_232933,)
      ),backgroundColor: Colors.white,elevation: 0,
        title: Text('????????????', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              children: [
                Text('708090???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????',
                    style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28),strutStyle: StrutStyle(
                      fontFamily: 'Roboto',
                      height: 1.2,
                      leading: 0.5,
                    )),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(116),
                      height: ScreenUtil().setWidth(116),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular( ScreenUtil().setWidth(116)),
                          border: Border.all(color: AppColors.COLOR_C8CFE0)
                      ),
                      child: Image.asset(AppImages.CONCAT_US_PHONE, width: ScreenUtil().setWidth(60),height: ScreenUtil().setWidth(60),),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('??????', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28)),
                        SizedBox(height: 5,),
                        Text('0755-84181558', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28)),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(116),
                      height: ScreenUtil().setWidth(116),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular( ScreenUtil().setWidth(116)),
                          border: Border.all(color: AppColors.COLOR_C8CFE0)
                      ),
                      child: Image.asset(AppImages.CONCAT_US_EMAIL,width: ScreenUtil().setWidth(60),height: ScreenUtil().setWidth(60)),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('????????????', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28)),
                        SizedBox(height: 5,),
                        Text('chinas708090@163.com', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28)),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(116),
                      height: ScreenUtil().setWidth(116),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular( ScreenUtil().setWidth(116)),
                          border: Border.all(color: AppColors.COLOR_C8CFE0)
                      ),
                      child: Image.asset(AppImages.CONCAT_US_ADDRESS, fit: BoxFit.fitWidth, width: ScreenUtil().setWidth(60),height: ScreenUtil().setWidth(60)),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('??????', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28)),
                        SizedBox(height: 5,),
                        Text('?????????????????????????????????????????????B?????????', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28)),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  height: ScreenUtil().setWidth(400),
                  child: Image.asset(AppImages.MAP_IMG, fit: BoxFit.cover),
                ),
                SizedBox(height: 15,),
                // Container(
                //   height: ScreenUtil().setWidth(400),
                //   child: BMFMapWidget(
                //     onBMFMapCreated: (controller) {
                //       onBMFMapCreated(controller);
                //     },
                //     mapOptions: mapOptions,
                //   ),
                // ),
                // SizedBox(height: 15,),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
