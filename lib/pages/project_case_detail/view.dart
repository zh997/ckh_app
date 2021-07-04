import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/constant/app_images.dart';
import 'package:ckh_app/models/news_active_info.dart';
import 'package:ckh_app/models/project_case.dart';
import 'package:ckh_app/models/project_case_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ProjectCaseDetailPage extends StatelessWidget {
  final ProjectCaseDetailLogic logic = Get.put(ProjectCaseDetailLogic());
  final ProjectCaseDetailState state = Get.find<ProjectCaseDetailLogic>().state;

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
            title: Text('案例详情', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
            centerTitle: true,
          ),
          body: Obx((){
            final ProjectCaseDetailModel activeInfo = state.activeInfo.value;
            return ListView(
              padding: EdgeInsets.only(),
              children: [
                activeInfo.imgArr.length > 0 ? _Swiper(activeInfo.imgArr): SizedBox(),
                SizedBox(height: 10,),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(activeInfo.title, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text(activeInfo.abstract, style:  TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28),),
                      SizedBox(height: 10,),
                      HtmlWidget(activeInfo.content, textStyle: TextStyle(
                        color: AppColors.COLOR_2C3340,
                        fontSize: AppFont.SIZE_28,
                        fontFamily: 'Roboto',
                        height: 1.5,
                      )),
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
            );
          }),
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
