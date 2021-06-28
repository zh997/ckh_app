import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class ProjectCaseDetailLogic extends GetxController {
  final state = ProjectCaseDetailState();
  String id = Get.parameters['id'];
  Future onInitData() async {
    RealResponseData response = await AppService.projectListsInfo(id);
    if (response.result) {
      state.activeInfo.value = response.data;
    }
  }
}
