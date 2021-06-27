import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class IntroductionLogic extends GetxController {
  final state = IntroductionState();

  Future onInitData() async {
    RealResponseData response = await AppService.companyIntroduction();
    if (response.result) {
      state.companyList.value = response.data;
    }
  }
}
