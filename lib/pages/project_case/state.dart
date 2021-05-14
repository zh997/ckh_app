import 'package:ckh_app/constant/app_images.dart';
import 'package:get/get.dart';

class ProjectCaseState {
  RxList<ProjectCaseItem> projectCaseList = [
    ProjectCaseItem(url: AppImages.PROJECT_CASE_1, title: '棕科云端项目', subtitle: '棕科云端项目位于深圳市龙岗区布吉西环路，为深圳罗湖北未来高尚城市综合体地标。', loaction: '深圳'),
    ProjectCaseItem(url: AppImages.PROJECT_CASE_2, title: '708090创乐坊', subtitle: '位于东莞市樟木头永隆路华都花园底商，承接深圳兄弟项目708090创客汇（创新创业青春学堂）…', loaction: '东莞'),
    ProjectCaseItem(url: AppImages.PROJECT_CASE_3, title: '金港湾广场', subtitle: '金港湾广场位于徐州市鼓楼区黄河西路3号，地处徐州市核心商贸区,地理位置优越…', loaction: '徐州'),
  ].obs;
  ProjectCaseState() {
    ///Initialize variables
  }
}

class ProjectCaseItem {
  String url;
  String title;
  String subtitle;
  String loaction;
  ProjectCaseItem({this.url, this.title, this.subtitle, this.loaction});
}