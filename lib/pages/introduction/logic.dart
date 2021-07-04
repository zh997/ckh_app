import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class IntroductionLogic extends GetxController {
  final state = IntroductionState();
  String id = Get.parameters['id'];

  Future onInitData() async {
    if (id != null) {
      RealResponseData response = await AppService.settledCompanyInfo(id);
      if (response.result) {
        state.companyList.value = response.data;
      }
    } else {
      RealResponseData response = await AppService.companyIntroduction();
      if (response.result) {
        state.companyList.value = response.data;
      }
    }
  }

}
