import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class NewsLogic extends GetxController {
  final state = NewsState();

  Future onInitData() async {
    RealResponseData response = await AppService.news();
    if (response.result) {
      state.newsList.value = response.data;
    }
  }
}
