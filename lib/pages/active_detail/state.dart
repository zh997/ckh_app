import 'package:ckh_app/models/news_active_info.dart';
import 'package:ckh_app/models/news_detail.dart';
import 'package:get/get.dart';

class ActiveDetailState {
  Rx<NewDetailModel> activeInfo = NewDetailModel().obs;
  ActiveDetailState() {
    ///Initialize variables
  }
}
