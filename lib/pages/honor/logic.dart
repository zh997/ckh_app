import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class HonorLogic extends GetxController {
  final state = HonorState();
  Future onInitData() async {
    RealResponseData response = await AppService.honnerList();
    if (response.result) {
      state.honorList.value = response.data;
    }
  }
}
