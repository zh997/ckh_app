import 'package:ckh_app/models/news_active_info.dart';
import 'package:get/get.dart';

class ActiveDetailState {
  Rx<NewsLatestDeventsInfoModel> activeInfo = NewsLatestDeventsInfoModel().obs;
  ActiveDetailState() {
    ///Initialize variables
  }
}
