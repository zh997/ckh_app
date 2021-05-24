import 'package:ckh_app/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';
import 'package:ckh_app/common/routes.dart';
import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/widgets/app_buttons.dart';
import 'package:ckh_app/widgets/app_text_field.dart';

import 'logic.dart';
import 'state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;
  String pageType = 'pwd_login';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_rounded, size: 25, color: AppColors.COLOR_232933,)
      ),backgroundColor: Colors.white,elevation: 0,),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          pageType == 'pwd_login' ? Text('账号密码登陆', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_42)) :
          Text('手机验证码登录', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_42)),
          SizedBox(height: 20,),
          RowTextField(
            key: GlobalKey(),
            name: 'account',
            controller: TextEditingController(),
            icon: Image.asset(AppImages.LOGIN_ICON_5, width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50)),
            labelText: '请输入账号',
            labelLeft: 40,
          ),
          SizedBox(height: 20,),
          pageType == 'pwd_login' ? RowTextField(
            key: GlobalKey(),
            name: 'password',
            controller: TextEditingController(),
            icon: Image.asset(AppImages.LOGIN_ICON_1, width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50)),
            labelText: '请输入密码',
            obscureText: true,
            labelLeft: 40,
          ): RowTextField(
            key: GlobalKey(),
            name: 'password',
            controller: TextEditingController(),
            icon: Image.asset(AppImages.LOGIN_ICON_4, width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50)),
            labelText: '请输入验证码',
            obscureText: true,
            labelLeft: 40,
            suffixIcon: Text('获取验证码', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_32)),
          ),
          SizedBox(height: 50,),
          Container(
            child: PrimaryButton('登录'),
          ),
          SizedBox(height: 10,),
          _footerRow()
        ],
      )
    );
  }


  Widget _footerRow() {
    final String text = pageType == 'pwd_login' ? '手机验证码登录' : '账号密码登录';
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            if (pageType == 'pwd_login') {
              setState(() {
                pageType = 'code_login';
              });
            } else {
              setState(() {
                pageType = 'pwd_login';
              });
            }
          },
          child: Text(text, style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28)),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            Get.toNamed(RouteConfig.register_page);
          },
          child: Text('立即注册', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_28)),
        ),
      ],
    );
  }
}
