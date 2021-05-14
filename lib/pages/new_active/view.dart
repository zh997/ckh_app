import 'package:ckh_app/common/routes.dart';
import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class NewActivePage extends StatelessWidget {
  final NewActiveLogic logic = Get.put(NewActiveLogic());
  final NewActiveState state = Get.find<NewActiveLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.COLOR_F5F6FA,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
        title: Text('最新活动', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
        centerTitle: true,
      ),
        body: Obx((){
            final List<ActiveItem> activeList = state.activeList.value;
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
                              width: ScreenUtil().setWidth(170),
                              height: ScreenUtil().setWidth(170),
                              child: Image.asset(activeList[index].url, fit: BoxFit.cover,),
                            ),
                            SizedBox(width: 10,),
                            Expanded(child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(activeList[index].title, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_32, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                Text(activeList[index].subtitle, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_32,), maxLines: 2, overflow: TextOverflow.ellipsis,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(activeList[index].time, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_32,), maxLines: 2, overflow: TextOverflow.ellipsis,),
                                  ],
                                )
                              ],
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
