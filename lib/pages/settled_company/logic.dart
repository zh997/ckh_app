import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class SettledCompanyLogic extends GetxController {
  final state = SettledCompanyState();

  Future onInitData() async {
    RealResponseData response = await AppService.settledCompanyList();
    if (response.result) {
      state.settledList.value = response.data;
    }
  }

}
