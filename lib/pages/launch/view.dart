import 'dart:async';
import 'dart:math';
import 'package:ckh_app/common/routes.dart';
import 'package:ckh_app/common/storage.dart';
import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class LaunchPage extends StatelessWidget {
  final LaunchLogic logic = Get.put(LaunchLogic());
  final LaunchState state = Get.find<LaunchLogic>().state;
  // LaunchPage(){ logic.StartCountDown(); }
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Stack(
    //     fit: StackFit.expand,  // 未定位的元素充满Stack空间
    //     children: [
    //       Image.network('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1093264713,2279663012&fm=26&gp=0.jpg', fit: BoxFit.fill),
    //       Positioned(
    //         top: MediaQuery.of(context).padding.top + 30,
    //         right: 30,
    //         child: Container(
    //           padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10),
    //             color: Color(0x7F757575)
    //           ),
    //           child: Obx(() => Text('${state.CountDownSeconds}s', style: TextStyle(fontSize: 18, color: Colors.white))),
    //         )
    //       )
    //     ],
    //   ),
    // );
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.OPEN_IMG, width: ScreenUtil().setWidth(500), height: ScreenUtil().setWidth(500),),
            // SizedBox(height: ScreenUtil().setWidth(100),),
            Column(
              children: [
                Text('提供一站式创业服务', style: TextStyle(color: AppColors.COLOR_1c3328, fontSize: AppFont.SIZE_48),),
                // SizedBox(height: ScreenUtil().setWidth(30),),
                Text('成功孕育多个项目落地', style: TextStyle(color: AppColors.COLOR_76827c, fontSize: AppFont.SIZE_28),),
                // SizedBox(height: ScreenUtil().setWidth(130),),
              ],
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                AppStorage.setBool('isFirstOpen', false);
                Get.toNamed(RouteConfig.main_page);
              },
              child: Container(
                width: ScreenUtil().setWidth(380),
                height: ScreenUtil().setWidth(80),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.COLOR_31C27A,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Text('立即开启', style: TextStyle(color: Colors.white, fontSize: AppFont.SIZE_28),),
              ),
            )
          ],
        ) ,
      ) ,
    );
  }
}
