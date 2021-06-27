import 'dart:convert';

import 'package:ckh_app/constant/app_api_urls.dart';
import 'package:ckh_app/http/http_request.dart';
import 'package:ckh_app/http/response_data.dart';
import 'package:ckh_app/models/company_list.dart';
import 'package:ckh_app/models/home_index.dart';

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
}
