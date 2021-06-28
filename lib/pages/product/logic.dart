import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class ProductLogic extends GetxController {
  final state = ProductState();
  Future onInitData() async {
    RealResponseData response = await AppService.goodsList();
    if (response.result) {
      state.goodsList.value = response.data;
    }
  }
}
