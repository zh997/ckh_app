import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class ActiveDetailLogic extends GetxController {
  final state = ActiveDetailState();
  String id = Get.parameters['id'];
  String type = Get.parameters['type'];

  Future onInitData() async {

    if (int.parse(type) == 1) {
      RealResponseData response = await AppService.newsLatestDventsDetail(id);
      if (response.result) {
        state.activeInfo.value = response.data;
      }
    }
    if (int.parse(type) == 2) {
      RealResponseData response = await AppService.newsInfo(id);
      if (response.result) {
        state.newsInfo.value = response.data;
      }
    }
  }
}
