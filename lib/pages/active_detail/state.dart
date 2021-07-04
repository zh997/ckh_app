import 'package:ckh_app/models/news_active_info.dart';
import 'package:ckh_app/models/news_detail.dart';
import 'package:get/get.dart';

class ActiveDetailState {
  Rx<NewDetailModel> newsInfo = NewDetailModel().obs;
  Rx<NewsLatestDeventsInfoModel> activeInfo = NewsLatestDeventsInfoModel().obs;
  ActiveDetailState() {
    ///Initialize variables
  }
}
