import 'package:ckh_app/constant/app_images.dart';
import 'package:ckh_app/pages/new_active/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';
import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/pages/home/view.dart';
import 'logic.dart';
import 'state.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainLogic logic = Get.put(MainLogic());
  final MainState state = Get.find<MainLogic>().state;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            HomePage(pageController: pageController),
            NewActivePage(),
          ],
        ),
        bottomNavigationBar: Obx((){
          final int current = state.current.value;
          return BottomNavigationBar(
            selectedItemColor: AppColors.COLOR_31C27A,
            unselectedItemColor:  AppColors.COLOR_2C3340,
            selectedFontSize: 12.0,
            items:[
              BottomNavigationBarItem(
                label: '首页',
                icon: _bottomNavigationBarIcon(AppImages.nvbar_home),
                activeIcon: _bottomNavigationBarIcon(AppImages.nvbar_home_selected),
              ),
              BottomNavigationBarItem(
                label: '活动',
                icon: _bottomNavigationBarIcon(AppImages.nvbar_active),
                activeIcon: _bottomNavigationBarIcon(AppImages.nvbar_active_selected),
              )
            ] ,currentIndex: current, onTap: (index) {
              logic.onChangeTabBar(index);
              pageController.jumpToPage(index);
          },);
        })
    );
  }

  Image _bottomNavigationBarIcon(String imgUrl) {
      return Image.asset(
        imgUrl,
        width: ScreenUtil().setWidth(44),
        height: ScreenUtil().setWidth(44),
      );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
}
