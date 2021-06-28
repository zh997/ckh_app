import 'package:ckh_app/models/news_active_info.dart';
import 'package:get/get.dart';

class ProjectCaseDetailState {
  Rx<NewsLatestDeventsInfoModel> activeInfo = NewsLatestDeventsInfoModel().obs;
  ProjectCaseDetailState() {
    ///Initialize variables
  }
}
