import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/constant/app_images.dart';
import 'package:ckh_app/models/concat_us.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: logic.onInitData(), builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
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
          body: Obx((){
            final ConcatUsModel concatUs = state.concatUs.value;
            return  ListView(
              children: [
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(15),
                  color: Colors.white,
                  child: Column(
                    children: [
                      HtmlWidget(concatUs.companyTip, textStyle: TextStyle(
                        color: AppColors.COLOR_2C3340,
                        fontSize: AppFont.SIZE_28,
                        fontFamily: 'Roboto',
                        height: 1.5,
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
                              Text('电话', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28)),
                              SizedBox(height: 5,),
                              Text(concatUs.phone, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28)),
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
                              Text('电子邮件', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28)),
                              SizedBox(height: 5,),
                              Text(concatUs.email, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28)),
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
                              Text('地址', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28)),
                              SizedBox(height: 5,),
                              Text(concatUs.addres, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),

              ],
            );
          })
        );
      }
      return Center(child: SizedBox(
        child: CircularProgressIndicator(),
        width: 30,
        height: 30,
      ));
    });
  }
}
