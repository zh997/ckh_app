import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class PartnerPage extends StatelessWidget {
  final PartnerLogic logic = Get.put(PartnerLogic());
  final PartnerState state = Get.find<PartnerLogic>().state;

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
          title: Text('合作伙伴', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
          centerTitle: true,
        ),
        body: Obx((){
          final List<PartnerItem> partnerList = state.partnerList.value;
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 10,),),
              SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                return Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  padding: index % 2 > 0 ? EdgeInsets.only(right: 30, top: 0, left: 30) : EdgeInsets.only(left: 30, top: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(330),
                        height: ScreenUtil().setWidth(140),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.COLOR_CCD4E6, width: 1)
                        ),
                        child:  Image.asset(partnerList[index].url, fit: BoxFit.fill,),
                      ),
                    ],
                  ),
                );
              }, childCount: partnerList.length), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: ScreenUtil().setWidth(330)/ScreenUtil().setWidth(170),
                  crossAxisCount: 2
              )),
              SliverToBoxAdapter(child: SizedBox(height: 10,),),
            ],
          );
        })
    );
  }
}
