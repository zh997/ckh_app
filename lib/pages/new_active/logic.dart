import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class NewActiveLogic extends GetxController {
  final state = NewActiveState();
  Future onInitData() async {
    RealResponseData response = await AppService.newsLatestDvents();
    if (response.result) {
      state.activeList.value = response.data;
    }
  }
}
