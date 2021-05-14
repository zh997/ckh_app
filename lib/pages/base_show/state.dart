import 'package:ckh_app/constant/app_images.dart';
import 'package:get/get.dart';

class BaseShowState {
  RxList<BaseItem> baseList = [
    BaseItem(url: AppImages.BASE_SHOW_1, text: '深圳708090创客汇会议室'),
    BaseItem(url: AppImages.BASE_SHOW_2, text: '　深圳棕科云端项目'),
  ].obs;
  BaseShowState() {
    ///Initialize variables
  }
}

class BaseItem {
  String url;
  String text;
  BaseItem({this.url, this.text});
}

