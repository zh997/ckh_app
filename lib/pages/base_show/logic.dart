import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class BaseShowLogic extends GetxController {
  final state = BaseShowState();
  Future onInitData() async {
    RealResponseData response = await AppService.baseDisplaysList();
    if (response.result) {
      state.baseList.value = response.data;
    }
  }
}
