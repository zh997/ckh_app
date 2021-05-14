import 'package:get/get.dart';

class MainState {
  RxList<TabbarItem> TabBarList;
  RxInt current;
  MainState() {
    ///Initialize variables
    TabBarList = [
      TabbarItem('static/images/tabbar_home_selected_icon.jpg', 'static/images/tabbar_home_icon@3x.png', '首页'),
      TabbarItem('static/images/tabbar_active_icon@3x.png', 'static/images/tabbar_active_selected_icon@3x.png', '活动'),
    ].obs;
    current = 0.obs;
  }
}

class TabbarItem {
  String icon;
  String selected_icon;
  String text;

  TabbarItem(this.icon, this.selected_icon, this.text);
}
