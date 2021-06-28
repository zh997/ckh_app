import 'package:ckh_app/common/routes.dart';
import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ProjectCasePage extends StatelessWidget {
  final ProjectCaseLogic logic = Get.put(ProjectCaseLogic());
  final ProjectCaseState state = Get.find<ProjectCaseLogic>().state;

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
            title: Text('项目案例', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_36)),
            centerTitle: true,
          ),
          body: Obx(() {
            final List projectCaseList = state.projectCaseList.value;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 10,),),
                SliverPadding(padding: EdgeInsets.only(left: 10, right: 10), sliver: SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      Get.toNamed(RouteConfig.project_case_detail + '?id=${projectCaseList[index].id}');
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          Container(
                            height: ScreenUtil().setWidth(400),
                            child: Image.network(projectCaseList[index].cover, fit: BoxFit.fill,),
                          ),
                          Container(
                              padding: EdgeInsets.all(15),
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(projectCaseList[index].title, style: TextStyle(color: AppColors.COLOR_2C3340, fontSize: AppFont.SIZE_28, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Text(projectCaseList[index].abstract, style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28, height: 1.5),overflow: TextOverflow.ellipsis,maxLines: 5,),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: ScreenUtil().setWidth(221),
                                    height: ScreenUtil().setWidth(66),
                                    alignment: Alignment.center,
                                    color: AppColors.COLOR_31C27A,
                                    child: Text('查看详情 >>', style: TextStyle(color: Colors.white, fontSize: AppFont.SIZE_28)),
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  );
                }, childCount: projectCaseList.length))) ,
                SliverToBoxAdapter(child: SizedBox(height: 10,),),
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
