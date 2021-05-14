import 'package:ckh_app/constant/app_images.dart';
import 'package:get/get.dart';

class PartnerState {
  RxList<PartnerItem> partnerList = [
    PartnerItem(url: AppImages.PARTNER_iMG_1, text: '创客汇优秀创业公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_2, text: '创客汇诚信服务公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_3, text: '创客汇国家认证证书'),
    PartnerItem(url: AppImages.PARTNER_iMG_4, text: '创客汇国家级高新技术'),
    PartnerItem(url: AppImages.PARTNER_iMG_5, text: '创客汇优秀创业公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_6, text: '创客汇诚信服务公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_7, text: '创客汇诚信服务公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_8, text: '创客汇诚信服务公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_9, text: '创客汇诚信服务公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_10, text: '创客汇诚信服务公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_11, text: '创客汇诚信服务公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_12, text: '创客汇诚信服务公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_13, text: '创客汇诚信服务公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_14, text: '创客汇诚信服务公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_15, text: '创客汇诚信服务公司'),
    PartnerItem(url: AppImages.PARTNER_iMG_16, text: '创客汇诚信服务公司'),
  ].obs;
  PartnerState() {
    ///Initialize variables
  }
}

class PartnerItem {
  String url;
  String text;
  PartnerItem({this.url, this.text});
}