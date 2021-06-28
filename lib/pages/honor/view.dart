import 'package:ckh_app/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
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
              title: Text('公司荣誉', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
              centerTitle: true,
            ),
            body: Obx((){
              final List honorList = state.honorList.value;
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 10,),),
                  SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      margin: index % 2 > 0 ? EdgeInsets.only(right: 10) : EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Container(
                            height: ScreenUtil().setWidth(300),
                            child:  Image.network(honorList[index].cover, fit: BoxFit.fitWidth,),
                          ),
                          SizedBox(height: 10,),
                          Text(honorList[index].title, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28))
                        ],
                      ),
                    );
                  }, childCount: honorList.length), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: ScreenUtil().setWidth(335)/ScreenUtil().setWidth(400),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10
                  )),
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
