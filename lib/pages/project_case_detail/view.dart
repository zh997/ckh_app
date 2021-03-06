import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ProjectCaseDetailPage extends StatelessWidget {
  final ProjectCaseDetailLogic logic = Get.put(ProjectCaseDetailLogic());
  final ProjectCaseDetailState state = Get.find<ProjectCaseDetailLogic>().state;

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
        title: Text('案例详情', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(),
        children: [
          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('深圳', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28, fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Container(width: ScreenUtil().setWidth(4),height: ScreenUtil().setWidth(28), color: AppColors.COLOR_31C27A,),
                    SizedBox(width: 5,),
                    Text('棕科云端项目', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28, fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10,),
                Text('棕科云端项目位于深圳市龙岗区布吉西环路，为深圳罗湖北未来高尚城市综合体地标。项目由香港主板上市公司钧濠集团有限公司(0115.HK)建设，占地约2.3万平方米 ，建筑面积约18万平方米，计容面积约9.8万平方米。总产值预计超过70亿。', style:  TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28),),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setWidth(400),
                  child: Image.asset(AppImages.PROJECT_CASE_1, fit: BoxFit.cover),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Container(
                      height: 1,
                      color: AppColors.COLOR_GRAY_F6F6F6,
                    )),
                    SizedBox(width: 10,),
                    Text('分享至', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFont.SIZE_28)),
                    SizedBox(width: 10,),
                    Expanded(child: Container(
                      height: 1,
                      color: AppColors.COLOR_GRAY_F6F6F6,
                    )) ,
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImages.WEICHAT_ICON, width: ScreenUtil().setWidth(70), height: ScreenUtil().setWidth(70),),
                    Image.asset(AppImages.CHROME_ICON, width: ScreenUtil().setWidth(70), height: ScreenUtil().setWidth(70),),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){

                      },
                      child: Image.asset(AppImages.QQ_ICON, width: ScreenUtil().setWidth(60), height: ScreenUtil().setWidth(60),),
                    ),
                    Image.asset(AppImages.QUNE_ICON, width: ScreenUtil().setWidth(70), height: ScreenUtil().setWidth(70),),
                    Image.asset(AppImages.WEIBO_ICON, width: ScreenUtil().setWidth(70), height: ScreenUtil().setWidth(70),),
                    Image.asset(AppImages.LINK_ICON, width: ScreenUtil().setWidth(60), height: ScreenUtil().setWidth(60),),
                  ],
                )
              ],
            ),
          ),


        ],
      ),
    );
  }
}
