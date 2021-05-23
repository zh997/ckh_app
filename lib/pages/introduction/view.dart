import 'package:ckh_app/common/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';
import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/constant/app_images.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'logic.dart';
import 'state.dart';

class IntroductionPage extends StatelessWidget {
  final IntroductionLogic logic = Get.put(IntroductionLogic());
  final IntroductionState state = Get.find<IntroductionLogic>().state;

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
        body:Column(
          children: [
            Expanded(child: ListView(
              padding: EdgeInsets.only(),
              children: [
                SizedBox( height: 15,),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('708090创客汇', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_32)),
                      SizedBox(height: 20,),
                      Text('708090创客汇于2015年12月成立，提供联合办公空间及内地与香港商业咨询服务。截止2019年，708090创客汇在深圳及香港已有3个驻点，合作机构约30家，管理面积约5,000平方米。', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28), strutStyle: StrutStyle(
                          fontFamily: 'Roboto',
                        height: 1.2,
                          leading: 0.5,
                      ),),
                      SizedBox(height: 20,),
                      Text('作为深圳市龙岗区布吉街道首家“创新创业孵化基地”，本空间提供一站式的创业服务，通过为创业团队提供办公场地、会议空间、融资服务、营销推广、人力资源、法务财务、管理、媒体传播等服务，公益创业培训、以铸造业界领先的创客空间。本创客空间旨在为各位年轻有为、有梦想、有干劲的创业家提供帮助，透过共享空间、天使投资、创业指导、业务交流等，致力让创业家相信创业不再是一个困难，并且成功实现梦想。', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28),strutStyle: StrutStyle(
                        fontFamily: 'Roboto',
                        height: 1.2,
                        leading: 0.5,
                      ),),
                      SizedBox(height: 20,),
                      Text('本空间长期与内地、香港两地政府、大专院校、青年团体、社福机构等合作开展6期“创新创业青春学堂”。本项目免费为内地与香港创业青年提供两地交流创业平台，大力促进两地青年融洽并推动青年融入粤港湾大湾区建设。', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28),strutStyle: StrutStyle(
                        fontFamily: 'Roboto',
                        height: 1.2,
                        leading: 0.5,
                      ),),
                      SizedBox(height: 20,),
                      // Container(
                      //   child: Image.asset(AppImages.COMPANY_IMG_1, width: ScreenUtil().setWidth(690), height: ScreenUtil().setWidth(388)),
                      // ),
                      _Swiper(),
                      SizedBox(height: 20,),
                      Text('708090创客汇自创办以来，先后获各界政府授予「创新创业孵化基地」、「青年文明号」、「龙岗区创新创业先锋团队」、「十大深港交流合作创业空间」等光荣称号。其举办的6期「创新创业青春学堂」参与人次超过2000人，成功孕育多个项目落地，为两地青年创造商机。', style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28),strutStyle: StrutStyle(
                        fontFamily: 'Roboto',
                        height: 1.2,
                        leading: 0.5,
                      ),),
                    ],
                  ),
                ),
                SizedBox( height: 15,),
              ],
            )),
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 15, left: 15,right: 15, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      Get.toNamed(RouteConfig.honor_page);
                    },
                    child: Container(
                      height: ScreenUtil().setWidth(98),
                      alignment: Alignment.center,
                      color: AppColors.COLOR_FF7F25,
                      child: Text('公司荣誉', style: TextStyle(color: Colors.white, fontSize: AppFont.SIZE_32)),
                    ),
                  )),
                  Expanded(child:  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                       Get.toNamed(RouteConfig.settled_page);
                    },
                    child:Container(
                      height: ScreenUtil().setWidth(98),
                      alignment: Alignment.center,
                      color: AppColors.COLOR_31C27A,
                      child: Text('入驻企业', style: TextStyle(color: Colors.white, fontSize: AppFont.SIZE_32)),
                    ),
                  )),
                  Expanded(child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      Get.toNamed(RouteConfig.base_show);
                    },
                    child:Container(
                      height: ScreenUtil().setWidth(98),
                      alignment: Alignment.center,
                      color: AppColors.COLOR_3295FF,
                      child: Text('基地展示', style: TextStyle(color: Colors.white, fontSize: AppFont.SIZE_32)),
                    ),
                  )),
                ],
              ),
            )
          ],
        )
    );
  }

  Widget _Swiper() {
    return Container(
      width: ScreenUtil().setWidth(690),
      height: ScreenUtil().setWidth(388),
      child: Swiper(
          key: UniqueKey(),
          duration: 1000,
          itemCount: state.BannerList.value.length,
          autoplay: true,
          pagination: SwiperPagination(
              builder: SwiperCustomPagination(builder: (BuildContext context, SwiperPluginConfig swiperPluginConfig) {
                double opacity (int index) {
                  if ( swiperPluginConfig.activeIndex == index) {
                    return 1.0;
                  } else {
                    return 0.3;
                  }
                }
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(state.BannerList.value.length, (index) => Opacity(
                        opacity: opacity(index),
                        child: Container(
                          margin: EdgeInsets.only(left: 2, right: 2),
                          width: ScreenUtil().setWidth(15),
                          height: ScreenUtil().setWidth(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(15)),
                              color: swiperPluginConfig.activeIndex == index ? AppColors.COLOR_31C27A :Colors.white
                          ),
                        )),
                    )
                );
              })
          ),
          itemBuilder: (BuildContext context,int index) => Image.asset(
              state.BannerList.value[index].url, fit: BoxFit.cover
          )
      ),
    );
  }
}
