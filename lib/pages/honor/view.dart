import 'package:ckh_app/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';

import 'logic.dart';
import 'state.dart';

class HonorPage extends StatelessWidget {
  final HonorLogic logic = Get.put(HonorLogic());
  final HonorState state = Get.find<HonorLogic>().state;


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
        title: Text('公司荣誉', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
        centerTitle: true,
      ),
      body: Obx((){
        final List<HonorItem> honorList = state.honorList.value;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 10,),),
            SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
              return Container(
                color: Colors.white,
                alignment: Alignment.center,
                padding: index % 2 > 0 ? EdgeInsets.only(right: 20, top: 0, left: 20) : EdgeInsets.only(left: 20, top: 0),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      child:  Image.asset(honorList[index].url, fit: BoxFit.fitWidth,),
                    ),
                    SizedBox(height: 10,),
                    Text(honorList[index].text, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28))
                  ],
                ),
              );
            }, childCount: honorList.length), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 200/230,
              crossAxisCount: 2
            )),
            SliverToBoxAdapter(child: SizedBox(height: 10,),),
          ],
        );
      })
    );
  }
}
