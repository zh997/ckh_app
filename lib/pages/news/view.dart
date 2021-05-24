import 'package:ckh_app/common/routes.dart';
import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class NewsPage extends StatelessWidget {
  final NewsLogic logic = Get.put(NewsLogic());
  final NewsState state = Get.find<NewsLogic>().state;

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
          title: Text('新闻资讯', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
          centerTitle: true,
        ),
        body: Obx((){
          final List<NewsItem> activeList = state.newsList.value;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 10,),),
              SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    Get.toNamed(RouteConfig.active_detail);
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(200),
                            height: ScreenUtil().setWidth(200),
                            child: Image.asset(activeList[index].url, fit: BoxFit.cover,),
                          ),
                          SizedBox(width: 10,),
                          Expanded(child:Container(
                            height: ScreenUtil().setWidth(200),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(activeList[index].title, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_32, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                Text(activeList[index].subtitle, style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_32,), maxLines: 2, overflow: TextOverflow.ellipsis,strutStyle: StrutStyle(
                                  fontFamily: 'Roboto',
                                  height: 0.4,
                                  leading: 0.5,
                                )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(activeList[index].time, style: TextStyle(color: AppColors.COLOR_B1B8C7, fontSize: AppFont.SIZE_32,), maxLines: 2, overflow: TextOverflow.ellipsis,),
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      )
                  ),
                ) ;
              }, childCount: activeList.length)),
              SliverToBoxAdapter(child: SizedBox(height: 10,),),
            ],
          );
        })
    );
  }
}
