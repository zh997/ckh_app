import 'package:ckh_app/constant/app_images.dart';
import 'package:get/get.dart';

class HonorState {
  RxList<HonorItem> honorList = [
    HonorItem(url: AppImages.COMPANY_HONOR_1, text: '创客汇优秀创业公司'),
    HonorItem(url: AppImages.COMPANY_HONOR_2, text: '创客汇诚信服务公司'),
    HonorItem(url: AppImages.COMPANY_HONOR_3, text: '创客汇国家认证证书'),
    HonorItem(url: AppImages.COMPANY_HONOR_4, text: '创客汇国家级高新技术'),
    HonorItem(url: AppImages.COMPANY_HONOR_5, text: '创客汇优秀创业公司'),
    HonorItem(url: AppImages.COMPANY_HONOR_6, text: '创客汇诚信服务公司'),
  ].obs;
  HonorState() {
    ///Initialize variables
  }
}

class HonorItem {
  String url;
  String text;
  HonorItem({this.url, this.text});
}
