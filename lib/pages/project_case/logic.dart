import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class ProjectCaseLogic extends GetxController {
  final state = ProjectCaseState();
  Future onInitData() async {
    RealResponseData response = await AppService.projectLists();
    if (response.result) {
      state.projectCaseList.value = response.data;
    }
  }
}
