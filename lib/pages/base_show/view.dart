import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class BaseShowPage extends StatelessWidget {
  final BaseShowLogic logic = Get.put(BaseShowLogic());
  final BaseShowState state = Get.find<BaseShowLogic>().state;

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
            title: Text('基地展示', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
            centerTitle: true,
          ),
          body:  Obx((){
            final List baseList = state.baseList.value;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 15,),),
                SliverPadding(padding: EdgeInsets.only(left: 15, right: 15), sliver: SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        Container(
                          height: ScreenUtil().setWidth(390),
                          child: Image.network(baseList[index].cover, fit: BoxFit.cover,),
                        ),
                        Container(
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            child: Text(baseList[index].title, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28),)
                        )
                      ],
                    ),
                  );
                }, childCount: baseList.length)),),
                SliverToBoxAdapter(child: SizedBox(height: 15,),),
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
}
