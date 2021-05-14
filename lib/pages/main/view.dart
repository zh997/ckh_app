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
  PageController pageController;

  @override
  void initState() {
    // TODO: implement setState
    print(state.current.value);
    pageController = PageController(initialPage: state.current.value);
    super.initState();
  }

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
        bottomNavigationBar: Obx(() => _BottomAppBar(state.TabBarList, state.current.value, logic, pageController))
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
}

class _BottomAppBar extends StatelessWidget{
  final List<TabbarItem> list;
  final int current;
  final MainLogic logic;
  final PageController pageController;
  _BottomAppBar(this.list, this.current, this.logic, this.pageController);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        selectedItemColor: AppColors.COLOR_31C27A,
        unselectedItemColor:  AppColors.COLOR_2C3340,
        selectedFontSize: 12.0,
      items:  List.generate(list.length, (index) => BottomNavigationBarItem(
        icon: current == index ? Image.asset(list[index].selected_icon, width: ScreenUtil().setWidth(44),height:  ScreenUtil().setWidth(44)) :
        Image.asset(list[index].icon, width: ScreenUtil().setWidth(44),height:  ScreenUtil().setWidth(44)),
        title: Padding(padding: EdgeInsets.only(top: 3),child: Text(list[index].text),)
    )),currentIndex: current, onTap: (index) {
      logic.onChangeTabBar(index);
      pageController.jumpToPage(index);
    },);
  }
}
