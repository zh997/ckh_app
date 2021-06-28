import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class PartnerLogic extends GetxController {
  final state = PartnerState();
  Future onInitData() async {
    RealResponseData response = await AppService.partnerList();
    if (response.result) {
      state.partnerList.value = response.data;
    }
  }
}
