import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class ConcatUsLogic extends GetxController {
  final state = ConcatUsState();
  Future onInitData() async {
    RealResponseData response = await AppService.contractUs();
    if (response.result) {
      state.concatUs.value = response.data;
    }
  }
}
