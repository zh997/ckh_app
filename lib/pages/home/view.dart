import 'package:ckh_app/models/home_index.dart';
import 'package:ckh_app/pages/main/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:ckh_app/common/routes.dart';
import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/constant/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

import 'logic.dart';
import 'state.dart';

class HomePage extends StatelessWidget {
  final HomeLogic logic = Get.put(HomeLogic());
  final MainLogic mainLogic = Get.put(MainLogic());
  final HomeState state = Get.find<HomeLogic>().state;
  final PageController pageController;

  HomePage({Key key, this.pageController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: logic.onInitHomeData() ,builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        return Obx(() {
          final List<IconItem> iconList = state.iconList.value;
          final HomeIndexModel homeIndexModel = state.homeIndexData.value;
          final List<SliderList> sliderList = homeIndexModel.sliderList;
          return Scaffold(
              backgroundColor: AppColors.COLOR_F5F6FA,
              body: Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child:  _Swiper(sliderList),
                      ),
                      SliverToBoxAdapter(
                        child:  Container(height: 15, color: Colors.white,),
                      ),
                      SliverGrid(delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index){
                            final IconItem item = iconList[index];
                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () async {
                                if (index == 1) {
                                  mainLogic.onChangeTabBar(1);
                                  pageController.jumpToPage(1);
                                } else if (index == 6){
                                  // Android
                                  const url = 'snssdk1128://';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  }
                                } else {
                                  Get.toNamed(item.route);
                                }
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 100,
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(item.url, width: ScreenUtil().setWidth(100), height: ScreenUtil().setWidth(100)),
                                      Text(item.text, style: TextStyle(color: AppColors.COLOR_353532, fontSize: AppFont.SIZE_28))
                                    ],
                                  )
                              ) ,
                            );
                          },
                          childCount: 9
                      ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 100/70,
                        crossAxisCount: 3,
                      )),
                      SliverToBoxAdapter(
                        child:  Container(height: 15, color: Colors.white,),
                      ),
                    ],
                  ),
                  Positioned(
                      top: MediaQuery.of(context).padding.top + 10,
                      left: 20,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          Get.toNamed(RouteConfig.login_page);
                        },
                        child: Row(children: [
                          Image.asset(AppImages.ICON_1, width: ScreenUtil().setWidth(54), height: ScreenUtil().setWidth(54)),
                          SizedBox(width: 10),
                          Text('未登陆', style: TextStyle(color: Colors.white, fontSize: AppFont.SIZE_28))
                        ],),
                      ))
                ],
              )
          );
        });
      }
      return Center(child: SizedBox(
        child: CircularProgressIndicator(),
        width: 30,
        height: 30,
      ));
    });
  }


  Widget _Swiper(List<SliderList> sliderList) {
    print(sliderList);
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setWidth(460),
      child: sliderList != null ? Swiper(
          key: UniqueKey(),
          duration: 1000,
          itemCount: sliderList.length,
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
                double _height (int index) {
                  if ( swiperPluginConfig.activeIndex == index) {
                    return ScreenUtil().setWidth(6);
                  } else {
                    return ScreenUtil().setWidth(4);
                  }
                }
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(sliderList.length, (index) => Opacity(
                      opacity: opacity(index),
                      child: Container(
                        margin: EdgeInsets.only(left: 1, right: 1),
                        width: ScreenUtil().setWidth(30),
                        height: _height(index),
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                      )),
                    )
                );
              })
          ),
          itemBuilder: (BuildContext context,int index) => Image.network(
              sliderList[index].url, fit: BoxFit.cover
          )
      ) : SizedBox(),
    );
  }
}
