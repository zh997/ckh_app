import 'package:ckh_app/common/routes.dart';
import 'package:ckh_app/models/company_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';
import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'logic.dart';
import 'state.dart';

class IntroductionPage extends StatelessWidget {
  final IntroductionLogic logic = Get.put(IntroductionLogic());
  final IntroductionState state = Get.find<IntroductionLogic>().state;

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
            body:Column(
              children: [
                Expanded(child: Obx(() {
                  final CompanyListModel compnayList = state.companyList.value;
                  return ListView(
                    padding: EdgeInsets.only(),
                    children: [
                      SizedBox( height: 15,),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(compnayList.title, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_32)),
                            SizedBox(height: 20,),
                            HtmlWidget(compnayList.contentOne,textStyle: TextStyle(
                                color: AppColors.COLOR_2C3340,
                                fontSize: AppFont.SIZE_28,
                                fontFamily: 'Roboto',
                                height: 1.5,
                            )),
                            SizedBox(height: 20,),
                            HtmlWidget(compnayList.contentTwo,textStyle: TextStyle(
                              color: AppColors.COLOR_2C3340,
                              fontSize: AppFont.SIZE_28,
                              fontFamily: 'Roboto',
                              height: 1.5,
                            )),
                            SizedBox(height: 20,),
                            // Container(
                            //   child: Image.asset(AppImages.COMPANY_IMG_1, width: ScreenUtil().setWidth(690), height: ScreenUtil().setWidth(388)),
                            // ),
                            _Swiper(compnayList.imgArr),
                          ],
                        ),
                      ),
                      SizedBox( height: 15,),
                    ],
                  );
                })),
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
      return Center(child: SizedBox(
        child: CircularProgressIndicator(),
        width: 30,
        height: 30,
      ));
    });
  }

  Widget _Swiper(List<String> imgArr) {
    return Container(
      width: ScreenUtil().setWidth(690),
      height: ScreenUtil().setWidth(388),
      child:imgArr != null ?  Swiper(
          key: UniqueKey(),
          duration: 1000,
          itemCount: imgArr.length,
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
                    children: List.generate(imgArr.length, (index) => Opacity(
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
          itemBuilder: (BuildContext context,int index) => Image.network(
              imgArr[index], fit: BoxFit.cover
          )
      ) : SizedBox(),
    );
  }
}
