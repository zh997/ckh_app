import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/services/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final state = HomeState();

  @override
  Future onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  Future onInitHomeData() async {
    RealResponseData response = await AppService.homeIndex();
    if (response.result){
      state.homeIndexData.value = response.data;
    }
  }
}
