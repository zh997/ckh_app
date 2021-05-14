import 'package:ckh_app/pages/active_detail/view.dart';
import 'package:ckh_app/pages/base_show/view.dart';
import 'package:ckh_app/pages/concat_us/view.dart';
import 'package:ckh_app/pages/honor/view.dart';
import 'package:ckh_app/pages/new_active/view.dart';
import 'package:ckh_app/pages/news/view.dart';
import 'package:ckh_app/pages/product/view.dart';
import 'package:ckh_app/pages/settled_company/view.dart';
import 'package:get/get.dart';
import 'package:ckh_app/pages/guide/view.dart';
import 'package:ckh_app/pages/introduction/view.dart';
import 'package:ckh_app/pages/launch/view.dart';
import 'package:ckh_app/pages/login/view.dart';
import 'package:ckh_app/pages/main/view.dart';
import 'package:ckh_app/pages/register/view.dart';
import 'package:ckh_app/pages/project_case/view.dart';
import 'package:ckh_app/pages/project_case_detail/view.dart';
import 'package:ckh_app/pages/partner/view.dart';
import 'package:ckh_app/pages/humen_resource/view.dart';

class RouteConfig {
  static final String launch_page = '/';
  static final String guide_page = '/guide_page';
  static final String main_page = '/main_page';
  static final String login_page = '/login_page';
  static final String register_page = '/register_page';
  static final String introduction_page = '/introduction_page';
  static final String honor_page = '/honor_page';
  static final String settled_page = '/settled_page';
  static final String base_show = '/base_show';
  static final String new_active = '/new_active';
  static final String active_detail = '/active_detail';
  static final String news_page = '/news_page';
  static final String product_page = '/product_page';
  static final String project_case_page = '/project_case_page';
  static final String project_case_detail = '/project_case_detail';
  static final String partner_page = '/partner_page';
  static final String humen_resource = '/humen_resource';
  static final String concat_us = '/concat_us';

  static final List<GetPage> getPages = [
    GetPage(name: launch_page, page: () => LaunchPage(), transition: Transition.fadeIn),
    GetPage(name: guide_page, page: () => GuidePage()),
    GetPage(name: main_page, page: () => MainPage(), transition: Transition.fadeIn),
    GetPage(name: login_page, page: () => LoginPage()),
    GetPage(name: register_page, page: () => RegisterPage()),
    GetPage(name: introduction_page, page: () => IntroductionPage()),
    GetPage(name: honor_page, page: () => HonorPage()),
    GetPage(name: settled_page, page: () => SettledCompanyPage()),
    GetPage(name: base_show, page: () => BaseShowPage()),
    GetPage(name: new_active, page: () => NewActivePage()),
    GetPage(name: active_detail, page: () => ActiveDetailPage()),
    GetPage(name: news_page, page: () => NewsPage()),
    GetPage(name: product_page, page: () => ProductPage()),
    GetPage(name: project_case_page, page: () => ProjectCasePage()),
    GetPage(name: project_case_detail, page: () => ProjectCaseDetailPage()),
    GetPage(name: partner_page, page: () => PartnerPage()),
    GetPage(name: humen_resource, page: () => HumenResourcePage()),
    GetPage(name: concat_us, page: () => ConcatUsPage()),
  ];
}
