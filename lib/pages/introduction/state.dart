import 'package:ckh_app/models/company_list.dart';
import 'package:get/get.dart';

class IntroductionState {
  Rx<CompanyListModel> companyList = CompanyListModel().obs;
  IntroductionState() {
    ///Initialize variables
  }
}
