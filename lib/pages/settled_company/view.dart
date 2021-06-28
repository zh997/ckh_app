import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class SettledCompanyPage extends StatelessWidget {
  final SettledCompanyLogic logic = Get.put(SettledCompanyLogic());
  final SettledCompanyState state = Get.find<SettledCompanyLogic>().state;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: logic.onInitData(), builder: (BuildContext context, AsyncSnapshot snapshot) {
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
              title: Text('入驻企业', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
              centerTitle: true,
            ),
            body: Obx((){
              final List honorList = state.settledList.value;
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 10,),),
                  SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                    return Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(bottom: BorderSide(color: AppColors.COLOR_GRAY_EEEEEE, width: 1))
                      ),
                      child: Text(honorList[index].title, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28),),
                    );
                  }, childCount: honorList.length)),
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
