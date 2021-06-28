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
    return FutureBuilder(future: logic.onInitData(), builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
            backgroundColor: AppColors.COLOR_F5F6FA,
            appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
              title: Text('最新活动', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
              centerTitle: true,
            ),
            body: Obx((){
              final List activeList = state.activeList.value;
              print(activeList.length);
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 10,),),
                  SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        Get.toNamed(RouteConfig.active_detail + '?id=${activeList[index].id}&type=1');
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
                                child: Image.network(activeList[index].cover, fit: BoxFit.cover,),
                              ),
                              SizedBox(width: 10,),
                              Expanded(child: Container(
                                height: ScreenUtil().setWidth(200),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(activeList[index].title, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_32, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                    Text(activeList[index].abstract, style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_32,), maxLines: 2, overflow: TextOverflow.ellipsis,strutStyle: StrutStyle(
                                      fontFamily: 'Roboto',
                                      height: 0.5,
                                      leading: 0.5,
                                    )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(activeList[index].updateTime,
                                          style: TextStyle(color: AppColors.COLOR_B1B8C7,
                                            fontSize: AppFont.SIZE_32,), maxLines: 2,
                                          overflow: TextOverflow.ellipsis,),
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
      return Center(child: SizedBox(
        child: CircularProgressIndicator(),
        width: 30,
        height: 30,
      ));
    });
  }
}
