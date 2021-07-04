import 'dart:convert';

import 'package:ckh_app/constant/app_api_urls.dart';
import 'package:ckh_app/http/http_request.dart';
import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/models/company_list.dart';
import 'package:ckh_app/models/home_index.dart';
import 'package:ckh_app/models/project_case_detail.dart';
import 'package:ckh_app/models/setteld_company_list.dart';
import 'package:ckh_app/models/honner_list.dart';
import 'package:ckh_app/models/news_latest_dvents.dart';
import 'package:ckh_app/models/news_active_info.dart';
import 'package:ckh_app/models/partner_list.dart';
import 'package:ckh_app/models/concat_us.dart';
import 'package:ckh_app/models/goods_list.dart';
import 'package:ckh_app/models/news_detail.dart';
import 'package:ckh_app/models/project_case.dart';

class AppService {
   // 首页数据
   static Future<RealResponseData> homeIndex() async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.home_index, null, 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: HomeIndexModelFromJson));
     }
   }
   // 公司介绍
   static Future<RealResponseData> companyIntroduction() async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.compnay_list, null, 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: CompanyListModelFromJson));
     }
   }
   // 入驻企业列表
   static Future<RealResponseData> settledCompanyList() async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.settled_compnay_list, null, 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: SetteldCompanyListModelFromJson));
     }
   }
   // 公司荣誉
   static Future<RealResponseData> honnerList() async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.honor_lists, null, 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: HonnerListModelFromJson));
     }
   }
   // 基地展示
   static Future<RealResponseData> baseDisplaysList() async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.base_displays, null, 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: HonnerListModelFromJson));
     }
   }
   // 最新活动
   static Future<RealResponseData> newsLatestDvents() async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.latest_events, null, 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: NewsLatestDeventsListModelFromJson));
     }
   }
   // 活动详情
   static Future<RealResponseData> newsLatestDventsDetail(String id) async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.latest_events_info, {'id': id}, 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: NewsLatestDeventsInfoModelFromJson));
     }
   }
   // 新闻资讯
   static Future<RealResponseData> news() async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.new_lists, null , 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: NewDetailModelFromJson));
     }
   }
   // 新闻资讯详情
   static Future<RealResponseData> newsInfo(String id) async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.news_info, {'id': id} , 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: NewDetailModelFromJson));
     }
   }
   // 项目案例
   static Future<RealResponseData> projectLists() async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.project_lists, null, 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: ProjectCaseModelFromJson));
     }
   }
   //案例详情
   static Future<RealResponseData> projectListsInfo(String id) async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.project_info,{'id': id}, 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: ProjectCaseDetailModelFromJson));
     }
   }
   //合作伙伴
   static Future<RealResponseData> partnerList() async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.partnerlist, null , 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: PartnerListModelFromJson));
     }
   }
   // 人力资源
   static Future<RealResponseData> sendMessage(Map<String, dynamic> data) async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.send_message, data , 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data)));
     }
   }
   // 公司介绍
   static Future<RealResponseData> contractUs() async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.contract_us, null , 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: ConcatUsModelFromJson));
     }
   }
   // 公司产品
   static Future<RealResponseData> goodsList() async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.goods_list, null , 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: GoodsListModelFromJson));
     }
   }
   // 入驻企业详情
   static Future<RealResponseData> settledCompanyInfo(String id) async {
     DioResponseData response = await HttpRequest.request(AppApiUrls.settled_company_info, {'id': id} , 'POST');
     if (response.result && response.data != null) {
       return HttpRequest.catchError(ResponseData.fromJson(jsonDecode(response.data), fromJson: CompanyListModelFromJson));
     }
   }
}
