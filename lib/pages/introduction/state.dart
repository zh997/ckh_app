import 'package:ckh_app/common/routes.dart';
import 'package:get/get.dart';

class IntroductionState {
  RxList<SwiperItemModel> BannerList;
  IntroductionState() {
    ///Initialize variables
    BannerList = [
      SwiperItemModel({'url': 'static/images/active_detail_1@3x.png', 'color': '#000000'}),
      SwiperItemModel({'url': 'static/images/base_show_1.png', 'color': '#000000'}),
    ].obs;
  }
}

class SwiperItemModel {
  String url;
  String color;
  SwiperItemModel(Map<String, dynamic> json) {
    this.url = json['url'];
    this.color = json['color'];
  }
}
