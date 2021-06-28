import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class HumenResourceLogic extends GetxController {
  final state = HumenResourceState();

  Future onSendMsg(Map<String, dynamic> data) async {
    EasyLoading.show();
    RealResponseData response = await AppService.sendMessage(data);
    if (response.result) {
      EasyLoading.showSuccess('留言成功');
    }
    EasyLoading.dismiss();
  }
}
