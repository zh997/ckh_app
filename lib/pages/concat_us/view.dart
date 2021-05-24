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
  //   // // 构造检索参数
  //   // BMFPoiCitySearchOption poiCitySearchOption =
  //   // BMFPoiCitySearchOption(city: '深圳', keyword: '深圳市龙岗区布吉西环路德福广场B座二楼');
  //   // // 检索实例
  //   // BMFPoiCitySearch poiCitySearch = BMFPoiCitySearch();
  //   // // 检索回调
  //   // poiCitySearch.onGetPoiCitySearchResult(callback: (BMFPoiSearchResult result, BMFSearchErrorCode errorCode) {
  //   //   print('poi城市检索回调 errorCode = ${errorCode}  \n result = ${result?.toMap()}');
  //   //   // 解析reslut，具体参考demo
  //   // });
  //   // // 发起检索
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
        title: Text('公司介绍', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
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
                Text('	708090创客汇为驻场创客提供一站式的创业服务，通过为创业团队提供办公场地、会议空间、投资融资服务、营销推广、人力资源、法务财务、行政管理、媒体传播等服务。现时本公司在未来项目将计划营运长租公寓。',
                    style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28)),
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
                      child: Image.asset(AppImages.CONCAT_US_PHONE, width: ScreenUtil().setWidth(80),height: ScreenUtil().setWidth(80),),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('电话', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28)),
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
                      child: Image.asset(AppImages.CONCAT_US_EMAIL,width: ScreenUtil().setWidth(80),height: ScreenUtil().setWidth(80)),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('电子邮件', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28)),
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
                      child: Image.asset(AppImages.CONCAT_US_ADDRESS, fit: BoxFit.fitWidth, width: ScreenUtil().setWidth(80),height: ScreenUtil().setWidth(80)),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('地址', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28)),
                        SizedBox(height: 5,),
                        Text('深圳市龙岗区布吉西环路德福广场B座二楼', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28)),
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
