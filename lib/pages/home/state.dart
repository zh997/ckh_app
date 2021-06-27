
import 'package:ckh_app/common/routes.dart';
import 'package:ckh_app/models/home_index.dart';
import 'package:get/get.dart';

class HomeState {
  Rx<HomeIndexModel> homeIndexData = HomeIndexModel().obs;
  RxList<IconItem> iconList = [
    IconItem(url: 'static/images/home_entry_icon_2@3x.png', text: '公司介绍', route: RouteConfig.introduction_page),
    IconItem(url: 'static/images/home_entry_icon_9@3x.png', text: '最新活动'),
    IconItem(url: 'static/images/home_entry_icon_7@3x.png', text: '新闻资讯', route: RouteConfig.news_page),
    IconItem(url: 'static/images/home_entry_icon_1@3x.png', text: '公司产品', route: RouteConfig.product_page),
    IconItem(url: 'static/images/home_entry_icon_6@3x.png', text: '项目案例', route: RouteConfig.project_case_page),
    IconItem(url: 'static/images/home_entry_icon_3@3x.png', text: '合作伙伴', route: RouteConfig.partner_page),
    IconItem(url: 'static/images/home_entry_icon_8@3x.png', text: '直播'),
    IconItem(url: 'static/images/home_entry_icon_4@3x.png', text: '人力资源', route: RouteConfig.humen_resource),
    IconItem(url: 'static/images/home_entry_icon_5@3x.png', text: '联系我们', route: RouteConfig.concat_us),
  ].obs;
}

class IconItem {
  String url;
  String text;
  String route;
  IconItem({this.url, this.text, this.route});
}
