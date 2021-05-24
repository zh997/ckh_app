import 'package:ckh_app/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';
import 'package:ckh_app/constant/app_colors.dart';
import 'package:ckh_app/constant/app_fontsize.dart';
import 'package:ckh_app/widgets/app_buttons.dart';
import 'package:ckh_app/widgets/app_text_field.dart';

import 'logic.dart';
import 'state.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterLogic logic = Get.put(RegisterLogic());
  final RegisterState state = Get.find<RegisterLogic>().state;

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
            Text('注册', style: TextStyle(color: AppColors.COLOR_232933, fontSize: AppFont.SIZE_42)),
            SizedBox(height: 20,),
            RowTextField(
              key: GlobalKey(),
              name: 'account',
              controller: TextEditingController(),
              icon: Image.asset(AppImages.LOGIN_ICON_5, width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50)),
              labelText: '请输入用户名',
              labelLeft: 40,
            ),
            SizedBox(height: 20,),
            RowTextField(
              key: GlobalKey(),
              name: 'password',
              controller: TextEditingController(),
              icon: Image.asset(AppImages.LOGIN_ICON_1, width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50)),
              labelText: '请输入密码',
              obscureText: true,
              labelLeft: 40,
            ),
            SizedBox(height: 20,),
            RowTextField(
              key: GlobalKey(),
              name: 'password',
              controller: TextEditingController(),
              icon: Image.asset(AppImages.LOGIN_ICON_2, width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50)),
              labelText: '请再次输入密码',
              obscureText: true,
              labelLeft: 40,
            ),
            SizedBox(height: 20,),
            RowTextField(
              key: GlobalKey(),
              name: 'password',
              controller: TextEditingController(),
              icon: Image.asset(AppImages.LOGIN_ICON_3, width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50)),
              labelText: '请输入手机号',
              labelLeft: 40,
            ),
            SizedBox(height: 20,),
            RowTextField(
              key: GlobalKey(),
              name: 'password',
              controller: TextEditingController(),
              icon: Image.asset(AppImages.LOGIN_ICON_4, width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50)),
              labelText: '请输入验证码',
              labelLeft: 40,
              suffixIcon: Text('获取验证码', style: TextStyle(color: AppColors.COLOR_646D7F, fontSize: AppFont.SIZE_32)),
            ),
            SizedBox(height: 35,),
            Container(
              child: PrimaryButton('注册'),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('已有账号,', style: TextStyle(color: AppColors.COLOR_646D7F,fontSize: AppFont.SIZE_28 )),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    Get.back();
                  },
                  child: Text('去登陆,', style: TextStyle(color: AppColors.COLOR_31C27A,fontSize: AppFont.SIZE_28, decoration: TextDecoration.underline)),
                )
              ],
            )
          ],
        )
    );
  }
}
