import 'package:ckh_app/constant/app_images.dart';
import 'package:get/get.dart';
class NewActiveState {
  RxList activeList = [
    ActiveItem(url: AppImages.ACTIVE_IMG_1, title: '深圳市龙岗区就业和创业带动…', subtitle: '2015年12月20日，708090创客汇创新创业孵化基地正式揭牌…', time: '2021-05-02'),
    ActiveItem(url: AppImages.ACTIVE_IMG_2, title: '2016 首届 “青创聚智”创客…', subtitle: '2016年3 月 25 日，708090创客汇开展首次 “ 青创聚智 ” 创客交流活动…', time: '2021-05-01'),
    ActiveItem(url: AppImages.ACTIVE_IMG_3, title: '2019 吉华街道青春学堂活动', subtitle: '2019年6月-10月，由吉华街道团工委主办，708090创客汇承办的…', time: '2021-04-16'),
    ActiveItem(url: AppImages.ACTIVE_IMG_4, title: '2017 罗湖区青春学堂', subtitle: '2017年4月8日，由共青团深圳市罗湖区委员会，罗湖区青年企业家协会主办…', time: '2021-05-02')
  ].obs;
  NewActiveState() {
    ///Initialize variables
  }
}

class ActiveItem {
  String url;
  String title;
  String subtitle;
  String time;
  ActiveItem({this.url, this.title, this.subtitle, this.time});
}
