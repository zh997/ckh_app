import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ActiveDetailPage extends StatelessWidget {
  final ActiveDetailLogic logic = Get.put(ActiveDetailLogic());
  final ActiveDetailState state = Get.find<ActiveDetailLogic>().state;

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
        title: Text('活动详情', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(),
        children: [
          Container(
            height: ScreenUtil().setWidth(400),
            child: Image.asset(AppImages.BANNER_1, fit: BoxFit.fitWidth),
          ),
          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text('深圳市龙岗区就业和创业带动就业工作领导小组孵化基地开幕式', style:  TextStyle(color: AppColors.COLOR_2C3340, fontWeight: FontWeight.bold, fontSize: AppFont.SIZE_32),),
                SizedBox(height: 10,),
                Text('2015年12月20日，708090创客汇创新创业孵化基地正式揭牌。708090创客汇是龙岗区布吉街道第一个正式获政府授牌的创新创业孵化基地，由布吉街道办人力资源服务中心与708090创客汇共同规划建设。', style:  TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28),),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setWidth(400),
                  child: Image.asset(AppImages.ACTIVE_DETAIL_1, fit: BoxFit.cover),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(15), child: Row(
            children: [
              Container(
                width: ScreenUtil().setWidth(180),
                height: ScreenUtil().setWidth(66),
                alignment: Alignment.center,
                color: AppColors.COLOR_FF7F25,
                child: Text('上一篇', style: TextStyle(color: Colors.white, fontSize: AppFont.SIZE_28)),
              ),
              Container(
                width: ScreenUtil().setWidth(180),
                height: ScreenUtil().setWidth(66),
                alignment: Alignment.center,
                color: AppColors.COLOR_31C27A,
                child: Text('下一篇', style: TextStyle(color: Colors.white, fontSize: AppFont.SIZE_28)),
              )
            ],
          ),)

        ],
      ),
    );
  }
}
